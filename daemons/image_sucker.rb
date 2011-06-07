require 'rubygems'
require 'eventmachine'
require 'mongoid'
require 'carrierwave'
require 'carrierwave/orm/mongoid'
require 'fastimage'
require 'state_machine'

# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

# database_name = case Padrino.env
#   when :development then 'mongoaggro_development'
#   when :production  then 'mongoaggro_production'
#   when :test        then 'mongoaggro_test'
# end

database_name = 'mongoaggro_development'

Mongoid.database = Mongo::Connection.new(host, port).db(database_name)

CarrierWave.configure do |config|
  config.grid_fs_database = database_name
  config.grid_fs_host = host
end


require File.dirname(__FILE__) + '/../lib/image_finder'
require File.dirname(__FILE__) + '/../app/models/image_uploader'
require File.dirname(__FILE__) + '/../app/models/feed_item'
require File.dirname(__FILE__) + '/../app/models/feed'
require File.dirname(__FILE__) + '/../app/models/wire'

EventMachine.run do
  EM.add_periodic_timer(2) do
    download_images_for_feed_items
  end

  def download_images_for_feed_items
    feed_items = FeedItem.not_downloaded_yet
    feed_items.each do |item|
      item.download_image!
    end
  end

end

