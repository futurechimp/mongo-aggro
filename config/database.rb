
# Connection.new takes host, port
host = 'localhost'
port = Mongo::Connection::DEFAULT_PORT

database_name = case Padrino.env
  when :development then 'mongoaggro_development'
  when :production  then 'mongoaggro_production'
  when :test        then 'mongoaggro_test'
end

Mongoid.database = Mongo::Connection.new(host, port).db(database_name)

CarrierWave.configure do |config|
  config.grid_fs_database = database_name
  config.grid_fs_host = host
end

# You can also configure Mongoid this way
# Mongoid.configure do |config|
#   name = @settings["database"]
#   host = @settings["host"]
#   config.master = Mongo::Connection.new.db(name)
#   config.slaves = [
#     Mongo::Connection.new(host, @settings["slave_one"]["port"], :slave_ok => true).db(name),
#     Mongo::Connection.new(host, @settings["slave_two"]["port"], :slave_ok => true).db(name)
#   ]
# end
#
# More installation and setup notes are on http://mongoid.org/docs/

