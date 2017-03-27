class ReviewsController < ApplicationController
  before_action :store_find, only: [:new, :create, :edit, :update, :destroy]

  def new
    if user_signed_in?
      @user = User.find(current_user.id)
      @review = @store.reviews.new
    else
      flash[:notice] = "You must be signed in to leave a review!"
      redirect_to store_path(@store)
    end
  end

  def create
    @user = current_user.id
    @reviews = @store.reviews.new(review_params)
    if @store.save
      flash[:notice] = "Review Submitted"
      redirect_to store_path(@store)
    else
      flash[:alert] = "Review submission failed"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if current_user?
      @user = current_user.id
      @review = Review.find(params[:id])
      if @review.update(review_params)
        flash[:notice] = "Review has been updated"
        redirect_to store_path(@store)
      else
        flash[:alert] = "Update failed"
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted"
    redirect_to store_path(@store)
  end

private
  def store_find
    @store = Store.find(params[:store_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :store_id, :title, :body)
  end
end
