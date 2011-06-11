PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

require 'carrierwave/orm/mongoid'

# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

database_name = case PADRINO_ENV.to_sym
  when :development then 'mongoaggro_development'
  when :production  then 'mongoaggro_production'
  when :test        then 'mongoaggro_test'
end

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

  puts "image_sucker loaded"
end
