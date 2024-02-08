class BookingsController < ApplicationController
  # As an owner, I can list my bookings
  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # As an owner I can confirm or decline a booking (editing the booking)
  # update action
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_begin, :date_end, :user_id, :dj_id, :status)
  end
end
