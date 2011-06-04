module ImageFinder

  # Parses incoming feed data, partially downloads any images from their 
  # remote locations, checks all image sizes, and returns the one with the 
  # largest pixel area.
  #
  # @param [String] data some text.
  #
  # @return [String] the URL of the image having the largest pixel area, or nil.
  #
  def largest_image(data)
    image_urls = parse(data)
    biggest = ""
    maxsize = 0
    image_urls.each do |url|
      dimensions = FastImage.size(url)
      area = dimensions[0] * dimensions[1] if dimensions
      if dimensions && area > maxsize
        biggest = url
        maxsize = area
      end
    end
    return biggest == "" ? nil : biggest
  end
    
  private

  # Parses incoming feed data, returning an array of absolute paths to the
  # JPG, PNG, and GIF images contained in the feed.
  #
  # @param [String] data the incoming feed text.
  #
  # @return [Array] an array of image URLs.
  #
  def parse(data)
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