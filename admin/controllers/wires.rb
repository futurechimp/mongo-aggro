Admin.controllers :wires do

  get :index do
    @wires = Wire.all
    render 'wires/index'
  end

  get :new do
    @wire = Wire.new
    render 'wires/new'
  end

  post :create do
    @wire = Wire.new(params[:wire])
    if @wire.save
      flash[:notice] = 'Wire was successfully created.'
      redirect url(:wires, :edit, :id => @wire.id)
    else
      render 'wires/new'
    end
  end

  get :edit, :with => :id do
    @wire = Wire.find(params[:id])
    render 'wires/edit'
  end

  put :update, :with => :id do
    @wire = Wire.find(params[:id])
    if @wire.update_attributes(params[:wire])
      flash[:notice] = 'Wire was successfully updated.'
      redirect url(:wires, :edit, :id => @wire.id)
    else
      render 'wires/edit'
    end
  end

  delete :destroy, :with => :id do
    wire = Wire.find(params[:id])
    if wire.destroy
      flash[:notice] = 'Wire was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Wire!'
    end
    redirect url(:wires, :index)
  end
end