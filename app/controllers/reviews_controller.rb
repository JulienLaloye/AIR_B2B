class ReviewsController < ApplicationController

# create
def create
  @review = Review.new(params[:booking])
  @review.save
end
end
