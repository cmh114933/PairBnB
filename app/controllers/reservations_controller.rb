class ReservationsController < ApplicationController
	def create
		byebug
		@reservation = Reservation.new(user_id:current_user.id,listing_id:params[:reservation][:listing_id],start_date:Date.parse(params[:reservation][:start_date]),end_date:Date.parse(params[:reservation][:end_date]))
		@listing = Listing.find(params[:reservation][:listing_id])
		valid = true
		period = (@reservation.start_date..@reservation.end_date)
		period.each do |rd|
			break valid = false if !@listing.available_dates.include? rd
		end
		if valid == true
			@reservation.save 
			period.each do |rd|
				@listing.available_dates.delete(rd)
			end
			@listing.save
		end
		redirect_to listing_path(params[:reservation][:listing_id])
	end
end
