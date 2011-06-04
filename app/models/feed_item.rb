class FeedItem
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

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


  # Validations
  #
  validates_presence_of :body, :url, :title, :feed, :wire, :moderation_status
  validates_inclusion_of :moderation_status, :in => %w( published featured )
  
  # Associations
  #
  belongs_to :feed
  belongs_to :wire
  
  # @return [String] the URL of the item's image file, properly sized to 
  # match its moderation_status. If this FeedItem has no image, the
  # parent Feed's image gets returned instead.
  def item_image
    if image?
      return image.url if self.moderation_status == "featured"
      return image.small.url if self.moderation_status == "published"
    else
      return feed.image.url if self.moderation_status == "featured"
      return feed.image.small.url if self.moderation_status == "published"       
    end
  end
  
  # You can define indexes on documents using the index macro:
  index :date_published

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
