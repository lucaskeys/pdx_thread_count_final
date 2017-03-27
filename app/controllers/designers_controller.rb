class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]


  def index
    @designers = Designer.all
  end

  def show
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)
     if @designer.save
       flash[:notice] = "designer successfully added"
       redirect_to designer_path(@designer)
     else
       flash[:warning] = "Unable to add designer"
       render :new
     end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @designer.update(designer_params)
      format.html { redirect_to @designer, notice: 'designer successfully updated'}
      format.json { render :show, status: :ok, location: @designer }
    else
      format.html { render :edit }
      format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @designer.destroy
    flash[:notice] = "Delete was successful"
    redirect_to designers_path
  end

  def add_stores
    @designer = Designer.find(params[:id])
    @designer.stores = []
      params[:store][:store_ids].each do |store_id|
        @designer.stores << store_id
    end
  end


private
  def set_designer
    @designer = Designer.find(params[:id])
  end

  def designer_params
    params.require(:designer).permit(:designer_name, :about, :designer_image)
  end
end
