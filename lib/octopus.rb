class Octopus

  include HTTParty
  base_uri OCTOPUS_URL
  basic_auth "admin", "admin"

  # Adds a resource to the Octopus.
  #
  def self.create_resource(feed)
    options = {
      :body => {
        :net_resource => { :url => feed.url },
        :subscription => {
          :url => "#{::SERVER_URL}/updates/notify/#{feed.id}"
        }
      }
    }
    post( '/create', options)
  end

end