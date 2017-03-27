class UserStoresController < ApplicationController
  before_action :set_user_store, only: [:show, :destroy]

  def index
    @user_stores = UserStore.all
  end

  def show
  end

  def new
    @user_store = UserStore.new
  end

  def edit
  end

  def create
    @user_store = UserStore.new(store_id: params[:store_id], user: current_user)
    respond_to do |format|
      if @user_store.save
        format.html { redirect_to stores_path, notice: "Store was successfully added" }
        format.json { render :show, status: :created, location: @user_store }
      else
        format.html { render :new }
        format.json { render json: @user_store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_store.destroy
    respond_to do |format|
      format.html { redirect_to stores_path, notice: "You are no longer following" }
      format.json { head :no_content }
    end
  end

  private

  def set_user_store
    @user_store = UserStore.find(params[:id])
  end

  def user_store_params
    params.require(:user_store).permit(:user_id, :store_id)
  end
end
