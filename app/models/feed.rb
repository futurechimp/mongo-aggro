class Feed
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # Fields
  #
  # field <name>, :type => <type>, :default => <value>
  field :url, :type => String
  field :default_moderation_status, :type => String

  # Validations
  #
  validates_presence_of :url, :wire
  
  # Associations
  #
  belongs_to :wire

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using
  # the key macro:
  # key :field <, :another_field, :one_more ....>
end
