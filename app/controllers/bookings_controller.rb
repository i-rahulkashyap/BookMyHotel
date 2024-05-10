# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_booking, only: [:show, :update, :destroy]
  
    # GET /bookings
    def index
      @bookings = Booking.all
      render json: @bookings, each_serializer: BookingSerializer
    end
  
    # GET /bookings/1
    def show
      render json: @booking, serializer: BookingSerializer
    end
  
    # POST /bookings
    def create
      @booking = Booking.new(booking_params)
  
      if @booking.save
        render json: @booking, status: :created, location: @booking, serializer: BookingSerializer
      else
        render json: @booking.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /bookings/1
    def update
      if @booking.update(booking_params)
        render json: @booking, serializer: BookingSerializer
      else
        render json: @booking.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /bookings/1
    def destroy
      @booking.destroy
      render json: { message: 'Booking was successfully destroyed.' }
    end

    def upcoming
      @bookings = Booking.upcoming_bookings
      render json: @bookings, each_serializer: BookingSerializer
    end
  
    def ongoing
      @bookings = Booking.ongoing_bookings
      render json: @bookings, each_serializer: BookingSerializer
    end
  
    def completed
      @bookings = Booking.completed_bookings
      render json: @bookings, each_serializer: BookingSerializer
    end
  
    def cancelled
      @bookings = Booking.cancelled_bookings
      render json: @bookings, each_serializer: BookingSerializer
    end
  
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_booking
        @booking = Booking.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def booking_params
        params.require(:booking).permit(:check_in, :check_out, :room_id, :user_id, :guests, :status)
      end
  end
  