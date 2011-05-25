# Helper methods defined here can be accessed in any controller or view in the application

Mongoaggro.helpers do
  # A convenience method which either grabs the page param or returns 1
  #
  def page_param
    (params[:page] ||= 1).to_i
  end
end