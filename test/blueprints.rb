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
  image { File.new(PADRINO_ROOT + "/test/fixtures/omegaman.jpg") }  
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

    include TestHelper::StubbedOctopusCalls
    include WebMock

    # Returns a Feed object with a pseudo-random uuid as its id.  We use the
    # bullshit_uuid because Machinist doesn't set an id on the new feed object
    # in feed = Feed.make, and we need the feed.id to stub successful net
    # resource creation.
    #
    def make_stubbed_feed
      feed = Feed.make
      stub_successful_net_resource_creation(feed)
      feed.save!
      feed
    end
      
    def make_wire
      wire = Wire.make
      wire.save

      feed = Feed.make
      stub_successful_net_resource_creation(feed)
      feed.save
      wire.feeds << feed
      
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