class FeedItem
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  # the ImageFinder module finds the largest image for us
  #
  include ImageFinder

  # Fields
  #
  # field <name>, :type => <type>, :default => <value>
  field :body, :type => String
  field :url, :type => String
  field :title, :type => String
  field :date_published, :type => DateTime
  field :moderation_status, :type => String

  # The CarrierWave uploader
  #
  mount_uploader :image, ImageUploader

  # Callbacks
  #
  # before_create :retrieve_image

  # Validations
  #
  validates_presence_of :body, :url, :title, :feed, :wire, :moderation_status
  validates_presence_of :date_published
  validates_inclusion_of :moderation_status, :in => %w( published featured )
  
  # Associations
  #
  belongs_to :feed
  belongs_to :wire
  
  # @return [String] the URL of the item's image file, properly sized to 
  # match its moderation_status. If this FeedItem has no image, the
  # parent Feed's image gets returned instead.
  #
  def item_image
    if image?
      return image.url if self.moderation_status == "featured"
      return image.small.url if self.moderation_status == "published"
    else
      return feed.image.url if self.moderation_status == "featured"
      return feed.image.small.url if self.moderation_status == "published"       
    end
  end
  
  # Set an index on :date_published for faster ordered retrieval.
  #
  index :date_published

  private
  
  # Retrieves the largest remote image from the web (using the ImageFinder
  # module) and inserts it into the database.
  #
  def retrieve_image
    largest = largest_image(self.body)
    self.remote_image_url = largest if largest
  end

end
