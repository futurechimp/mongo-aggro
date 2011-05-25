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

    # def make_wire_and_feed_with_feed_items
    #       wire = Wire.make(:feed => Feed.make)
    #       5.times do
    #         wire.feed_items << FeedItem.make
    #       end
    #       wire.feed.feed_items << wire.feed_items
    #       wire
    #     end
  end
end