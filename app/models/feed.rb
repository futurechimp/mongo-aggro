class Feed
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # Fields
  #
  # field <name>, :type => <type>, :default => <value>
  field :url, :type => String
  field :default_moderation_status, :type => String
  
  # The CarrierWave uploader
  #
  mount_uploader :image, ImageUploader

  # Validations
  #
  validates_presence_of :url, :wire
  validates_presence_of :image
  validates_format_of :url, :with => URI.regexp

  # Associations
  #
  belongs_to :wire
  has_many :feed_items
  
  # Callbacks
  #
  after_create :create_resource_on_octopus

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using
  # the key macro:
  # key :field <, :another_field, :one_more ....>
  
  # Creates or updates feed items for this feed based on incoming feed data.
  #
  # @param [String] data - the incoming raw feed data, in RSS, MediaRSS, or
  # Atom format.
  def update_feed_items(data)
    feed = FeedNormalizer::FeedNormalizer.parse(data,
                            :force_parser => FeedNormalizer::SimpleRssParser)
    if feed.nil?
      puts "Error: nil or badly-formatted feed."
    else
      raw_items = Hpricot(data).search("//item")
      raw_items = Hpricot(data).search("//entry") if 
        raw_items.nil? || raw_items.empty?
      feed.clean!
      feed.entries.each_with_index do |entry, index|
        feed_item = FeedItem.first(:conditions => { url => entry.url })
        feed_item = FeedItem.new unless feed_item
        feed_item.feed_id = self.id
        feed_item.title = entry.title
        feed_item.url = entry.url
        feed_item.body = Sanitize.clean(entry.content)
        feed_item.date_published = entry.date_published
        feed_item.wire_id = self.wire_id
        # feed_item.image_urls = parse(raw_items[index].to_s) if raw_items
        # feed_item.images_parsed = false
        self.feed_items << feed_item
      end
    end
  end
  
  private 
  
  # Tells the octopus to start watching this feed, notifying us with
  # any updates to it.
  #
  # @param [Feed] this feed object.
  def create_resource_on_octopus
    Octopus.create_resource(self)
  end
end
