# Rack middleware for serving images out of GridFS.
#
# Credits: http://antekpiechnik.com/posts/setting-up-carrierwave-file-uploads-using-gridfs-on-rails-3-and-mongoid
#
# This is not a great way of serving stuff in production, but it will work
# well enough for development. Production serving should be taken care of
# via the nginx-gridfs module, it's probably about 200 times faster.
#
class ServeGridfsImage
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] =~ /^\/grid\/(.+)$/
      process_request(env, $1)
    else
      @app.call(env)
    end
  end

  private  
  def process_request(env, key)
    begin
      Mongo::GridFileSystem.new(Mongoid.database).open(key, 'r') do |file|
        [200, { 'Content-Type' => file.content_type }, [file.read]]
      end
    rescue => ex
      [404, { 'Content-Type' => 'text/plain' }, ['File not found. ' + ex]]
    end
  end
end