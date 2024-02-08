class ReviewsController < ApplicationController
# create
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  #where to list the review

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :booking_id, :type_of_review)
  end
end
