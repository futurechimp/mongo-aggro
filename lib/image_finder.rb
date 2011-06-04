module ImageFinder

  # Parses incoming feed data, returning an array of absolute paths to the
  # JPG, PNG, and GIF images contained in the feed.
  #
  # @param [String] data the incoming feed data, which should be a string
  # rather than some kind of FeedNormalizer object.
  #
  # @return [Array] an array of image URLs.
  #
  def parse(data)
    image_urls = []
    uris = URI.extract(data)
    _image_urls = uris.select{|u|
      begin
        uri = URI.parse(u)
      rescue URI::InvalidURIError
        # Feel no pain! This guards against crappy uri parsing errors,
        # e.g. on "URIs" like "TRON:" (which I'm getting an error on right
        # now).
      end
      if uri && uri.path
        File.extname(uri.path) == ".jpg" || 
        File.extname(uri.path) == ".png" || 
        uri.query =~ /.png/ || 
        uri.query =~ /.jpg/
      end
    }
    return _image_urls
  end

end

