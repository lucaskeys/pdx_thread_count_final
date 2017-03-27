class DesignerStoresController < ApplicationController
  before_action :set_designer_store, only: [:show, :edit, :update, :destroy]

  def index
    @designer_stores = DesignerStore.all
  end

  def show
  end

  def new
    @designer_store = designerStore.new
  end

  def edit
  end

  def create
    if params[:store_ids].present?
      params[:stores].each do |a
      @designer_store = designerStore.new(store_id: params[:store_id], designer: params[:designer_store_params])
      respond_to do |format|
        if @designer_store.save
          format.html { redirect_to stores_path, notice: "Store was successfully added" }
          format.json { render :show, status: :created, location: @designer_store }
        else
          format.html { render :new }
          format.json { render json: @designer_store.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @designer_store.update(designer_store_params)
        format.html { redirect_to stores_path, notice: 'Store following was successfully updated.' }
        format.json { render :show, status: :ok, location: @designer_store }
      else
        format.html { render :edit }
        format.json { render json: @designer_store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @designer_store.destroy
    respond_to do |format|
      format.html { redirect_to stores_path, notice: "You are no longer following" }
      format.json { head :no_content }
    end
  end

  private

  def set_designer_store
    @designer_store = designerStore.find(params[:id])
  end

  def designer_store_params
    params.require(:designer_store).permit(:designer_id, :store_id)
  end
end
