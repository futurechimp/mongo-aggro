Admin.controllers :feeds do

  get :index do
    @feeds = Feed.all
    render 'feeds/index'
  end

  get :new do
    @wires = Wire.all
    @feed = Feed.new
    render 'feeds/new'
  end

  post :create do
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = 'Feed was successfully created.'
      redirect url(:feeds, :edit, :id => @feed.id)
    else
      render 'feeds/new'
    end
  end

  get :edit, :with => :id do
    @wires = Wire.all    
    @feed = Feed.find(params[:id])
    render 'feeds/edit'
  end

  put :update, :with => :id do
    @feed = Feed.find(params[:id])
    if @feed.update_attributes(params[:feed])
      flash[:notice] = 'Feed was successfully updated.'
      redirect url(:feeds, :edit, :id => @feed.id)
    else
      render 'feeds/edit'
    end
  end

  delete :destroy, :with => :id do
    feed = Feed.find(params[:id])
    if feed.destroy
      flash[:notice] = 'Feed was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Feed!'
    end
    redirect url(:feeds, :index)
  end
  
  post :notify, :with => :id do
    @feed = Feed.find(params[:id])
    @feed.update_feed_items(params[:data])
    "success"
  end
end