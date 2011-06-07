require 'rubygems'
require 'eventmachine'
require 'em-http-request'
require 'couchrest'
require 'couchrest_extended_document'
require 'state_machine'
require 'mini_magick'

COUCHDB_NAME = 'aggro_development'
COUCHDB = CouchRest.database!(COUCHDB_NAME)

require File.dirname(__FILE__) + '/../lib/image_finder'
require File.dirname(__FILE__) + '/../app/models/image'
require File.dirname(__FILE__) + '/../app/models/feed_item'

EventMachine.run do
  EM.add_periodic_timer(2) do
    create_image_objects_for_feed_items
    download_new_images
  end

  def download_new_images
    new_images = Image.by_state(:key => "new")
    new_images.each do |image|
      image.download!
    end
  end

  # Feed items are created through a bulk_save process, which doesn't hit
  # CouchRest's callbacks - so we can't tell the object to create necessary
  # Images for itself in an after_create callback.
  #
  # This method monitors the database for newly-created feed_items and
  # creates new Image objects for them if necessary.
  #
  def create_image_objects_for_feed_items
    new_feed_items = FeedItem.by_images_parsed(:key => false)
    new_feed_items.each do |item|
      item.create_images
    end
  end
end

