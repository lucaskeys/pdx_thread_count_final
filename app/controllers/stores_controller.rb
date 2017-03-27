class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]


  def index
    @stores = Store.all
  end

  def show
    @reviews = @store.reviews
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
     if @store.save
       flash[:notice] = "Store successfully added"
       redirect_to store_path(@store)
     else
       flash[:warning] = "Unable to add store"
       render :new
     end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
      format.html { redirect_to @store, notice: 'Store successfully updated'}
      format.json { render :show, status: :ok, location: @store }
    else
      format.html { render :edit }
      format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy
    flash[:notice] = "Delete was successful"
    redirect_to stores_path
  end


private
  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:store_name, :about, :store_image, :street_address, :street_address, :zip, :phone)
  end
end
