class ReservationMailer < ApplicationMailer
	default from: "testatester37@gmail.com"
	def booking_email(customer,host,reservation_id)
		@customer= customer
		@host = host
    	@url  = '/reservation/#{reservation_id}'
    	byebug
    	mail(to: @host.email, subject: 'Someone booked a reservation')
	end
end
