require 'machinist/object'
require File.expand_path(File.dirname(__FILE__) + "/test_config")


# Shams - generated filler values
#
Sham.define do
  name    { Faker::Name.first_name }
  email   { Faker::Internet.email  }
  url     { "http://" + Faker::Internet.domain_name }
  title   { Faker::Lorem.words }
end

Account.blueprint do
  name
  email
end

Feed.blueprint do
  url
  default_moderation_status { "published" }
  wire { Wire.make }
  #image { "foo.jpg" }
end

FeedItem.blueprint do
  body {"This is the body"}
  date_published { DateTime.now }
  # image { File.new(PADRINO_ROOT + "/test/fixtures/omegaman.jpg") }  
  title
  url
end

FeedItem.blueprint(:with_feed_and_wire) do
  wire { Wire.make }
  feed { Feed.make }
end

Wire.blueprint do
  name
end

# A factory which we can use to build objects which are a bit more complex or
# which require special setup which can't be done by Machinist without a bit of
# help.
#
module Factory
  class << self

    def make_wire
      wire = Wire.make
      wire.save

      wire.feeds << Feed.make
      wire.feeds.first.save
      
      5.times do
        feed_item = FeedItem.make
        wire.feed_items << feed_item
        wire.feeds.first.feed_items << feed_item
        feed_item.save
      end
      wire
    end
    
  end
end