class UsersController < ApplicationController
	def show
		@featured_listings = Listing.featured
		@listings=@featured_listings.page params[:page]
	end

	def edit
	end

	def edit_profile
		@user=current_user
	end

	def update
		@user=current_user

		@user.update(user_params)
		redirect_to edit_user_path(current_user.id)
	end


  private

  def user_params
    params.require(:user).permit(:email,{avatars:[]})
  end
end
