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
  url
  title
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


    def make_wire_with_feed_items
      wire = Wire.make
      wire.save
      items = []
      5.times do
        feed_item = FeedItem.make(:wire_id => wire.id)
        items << feed_item
      end
      FeedItem.database.bulk_save(items)
      wire
    end
  end
end