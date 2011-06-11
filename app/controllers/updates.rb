Mongoaggro.controllers :updates do

  post :notify, :with => :id do
    @feed = Feed.find(params[:id])
    @feed.update_feed_items(params[:data])
    "success"
  end

end