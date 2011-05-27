# Helper methods defined here can be accessed in any controller or view in the 
# application
#
Mongoaggro.helpers do
  
  # A convenience method which either grabs the page param or returns 1
  #
  def page_param
    (params[:page] ||= 1).to_i
  end
  
  # Truncates a string to a given number of words.
  #
  def shorten (string, word_limit = 5)
    words = string.split(/\s/)
    if words.size >= word_limit
      last_word = words.last
      words[0,(word_limit-1)].join(" ") + '...' + last_word
    else
      string
    end
  end
  
end