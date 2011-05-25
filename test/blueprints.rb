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

Wire.blueprint do
  name
end