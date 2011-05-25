class Wire
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # Fields
  #
  # field <name>, :type => <type>, :default => <value>
  field :name, :type => String
  
  # Associations
  #
  has_many :feeds
  
  # Validations
  #
  validates_presence_of :name

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
