Mongoaggro.controllers :wires do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    render 'wires/index'
  end

  get :show, :with => :id  do
    @wire = Wire.find(params[:id])
    @wires = Wire.all
    @feed_items = @wire.feed_items
    render 'home/index'
  end

end