class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @album = Album.find(params[:album_id])
    @reviews = @album.reviews
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @album = @review.album
    @review_owner = @review.user
  end

  def new
    @album = Album.find(params[:album_id])
    @review = Review.new
  end

  def create
    @album = Album.find(params[:album_id].to_i)
    @review = Review.new(review_params)
    @review.album = @album
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review has been successfully created'
    else
      flash[:notice] = 'You want to provide a strong review for a good rating, so please provide your explanation with at least 250 characters.'
    end
    redirect_to album_path(@album.id)
  end

  private
    def set_reviews
      @album = Album.find(params[:id])
      @reviews = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:body)
    end

    def authorize_user
      if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
