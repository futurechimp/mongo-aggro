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

  # Validations
  #
  validates_presence_of :body, :url, :title
  
  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
