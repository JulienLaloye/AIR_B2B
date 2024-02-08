class BookingsController < ApplicationController

  # As an owner, I can list my bookings
  def index
    @bookings = Booking.all
  end

  # As an owner I can confirm or decline a booking (editing the booking)
  # update action
  def update
    @booking = Booking.find(params[:id])
    @booking.update(params[:booking])
  end

end
