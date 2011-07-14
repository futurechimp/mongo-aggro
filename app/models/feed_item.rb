class FeedItem
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  # The ImageFinder module finds the largest image for us
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
  field :raw, :type => String  

  # The CarrierWave uploader
  #
  mount_uploader :image, ImageUploader

  # Validations
  #
  validates_presence_of :body, :url, :title, :feed, :wire, :moderation_status
  validates_presence_of :date_published
  validates_inclusion_of :moderation_status, :in => %w( published featured )
  
  # Associations
  #
  belongs_to :feed
  belongs_to :wire
  
  # Scopes
  #
  scope :not_downloaded_yet, where(:state => "not_downloaded_yet")
  scope :downloaded, where(:state => "downloaded")
  
  # State machine. Keeps track of whether this feed item has downloaded its
  # image or not.
  #
  # We don't care if downloading the image succeeds or fails, we just want to
  # mark this FeedItem as having been checked.
  #
  state_machine :initial => :not_downloaded_yet do
    after_transition :on => :download_image, :do => :do_retrieve_image

    event :download_image do
      transition :not_downloaded_yet => :downloaded
    end
  end
  
  
  # @return [String] the URL of the item's image file, properly sized to 
  # match its moderation_status. If this FeedItem has no image, the
  # parent Feed's image gets returned instead.
  #
  def item_image
    if image?
      return image.chopped.url if self.moderation_status == "featured"
      return image.small.url if self.moderation_status == "published"
    else
      return feed.image.chopped.url if self.moderation_status == "featured"
      return feed.image.small.url if self.moderation_status == "published"       
    end
  end
  
  # Set an index on :date_published for faster ordered retrieval.
  #
  index :date_published
  
  # Set an index on :url for faster retrieval.
  #
  index :url

  private

  # Retrieves the largest remote image from the web (using the ImageFinder
  # module) and inserts it into the database.
  #
  def do_retrieve_image
    largest = largest_image(self.raw) if self.raw
    if largest
      puts "Using: #{largest} for #{title}"
      self.remote_image_url = largest
      self.save 
    end
  end

end
