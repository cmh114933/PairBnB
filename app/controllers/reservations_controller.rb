class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show]
	def create
		
		@reservation = Reservation.new(user_id:current_user.id,listing_id:params[:reservation][:listing_id],start_date:Date.parse(params[:reservation][:start_date]),end_date:Date.parse(params[:reservation][:end_date]))
		@listing = Listing.find(params[:reservation][:listing_id])
		valid = true
		period = (@reservation.start_date..@reservation.end_date)
		period.each do |rd|
			break valid = false if !@listing.available_dates.include? rd
		end
		if valid == true
			@reservation.save 
			ReservationMailer.booking_email(current_user,@reservation.listing.user,@reservation.id).deliver_now
			period.each do |rd|
				@listing.available_dates.delete(rd)
			end
			@listing.save
		end
		redirect_to listing_path(params[:reservation][:listing_id])
	end
	def show
		@listing=Listing.find(@reservation.listing_id)
	end

	private

	def set_reservation
     	@reservation = Reservation.find(params[:id]) 
  end
end
