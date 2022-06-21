class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = @user.bookings.new(booking_params)
    if @booking.save
      redirect_to user_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:format])

  end

  def confirm
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.confirm!
    redirect_to bookings_path, status: 303
  end

  def cancel
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.cancel!
    redirect_to bookings_path, status: 303
  end

  private

  def booking_params
    params.require(:booking).permit(:capacity, :event_id, :user_id)
  end
end
