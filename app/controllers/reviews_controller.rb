# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only: [:show, :update, :destroy]
  
    # GET /reviews
    def index
      @reviews = Review.all
      render json: @reviews, each_serializer: ReviewSerializer
    end
  
    # GET /reviews/1
    def show
      render json: @review, serializer: ReviewSerializer
    end
  
    # POST /reviews
    def create
      @review = Review.new(review_params)
  
      if @review.save
        render json: @review, status: :created, location: @review, serializer: ReviewSerializer
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /reviews/1
    def update
      if @review.update(review_params)
        render json: @review, serializer: ReviewSerializer
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /reviews/1
    def destroy
      @review.destroy
      render json: { message: 'Review was successfully destroyed.' }
    end
  
    private
     
      def set_review
        @review = Review.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def review_params
        params.require(:review).permit(:rating, :user_id, :hotel_id)
      end
  end
  