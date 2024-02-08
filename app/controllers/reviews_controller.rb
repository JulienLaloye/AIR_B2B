class ReviewsController < ApplicationController

# As a user/owner I can review a booking
# index
def index
  @reviews = Review.all
end
# create
def new
  @review = Review.new
end

# As a user, I can cancel a booking
# update action
def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])
  @review.update(params[:booking])
end


end
