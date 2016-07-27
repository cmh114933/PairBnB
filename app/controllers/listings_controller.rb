class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :destroy, :show]
  def index 
    @listing=Listing.all
    @tag=Tag.new 
    @search = Listing.new

  end

  def new
    @listing = Listing.new
    @tags = @listing.tags.new
  end
 
  def create

    @listing = current_user.listings.new(listing_params)
    @listing.available_dates = []
    (Date.parse(params[:listing][:available_dates][:start_date])..Date.parse(params[:listing][:available_dates][:end_date])).each do |d|
      @listing.available_dates << d
    end
    if @listing.save
      @tag=params[:listing][:tag][:tag].downcase.split(",") 
      @listing
      @tag.each{|x| x.gsub!(" ","")}
      @tag.uniq.each do |name|
        @listing.tags.find_or_create_by(tag:name)
      end
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end

  def show
    @reservations=Reservation.where(listing_id:@listing.id)
    @reservation=Reservation.new

  end

  def edit
  end

  def update

    @listing.update(listing_params)

    temp =[]
    r_period = []
    Reservation.where(listing_id:@listing.id).each do |r|
      (r.start_date..r.end_date).each do |d|
        temp << d
      end
      r_period = r_period + temp
    end

    control=@listing.available_dates
    (Date.parse(params[:listing][:available_dates][:start_date])..Date.parse(params[:listing][:available_dates][:end_date])).each do |d|
        if !r_period.include? d
          if @listing.available_dates.include? d
            @listing.available_dates=@listing.available_dates-Array(d)
          else
            @listing.available_dates=@listing.available_dates+Array(d)
          end
        else
          @listing.available_dates = control
          break   
        end
      end
      @listing.save


      redirect_to listing_path(@listing.id)
  end

  def destroy
    @listing.delete
    redirect_to listings_path
  end

  def from_category
    # params[:tag[:tag]].downcase.split(",")
    input = params[:tag][:tag].downcase.split(",")

    input.each {|i| i.gsub!(" ","")}
    @listing = []
    input.uniq.each do |i|

          return @listing = [] if Tag.find_by_tag(i) == nil
          next @listing = Array(Tag.find_by_tag(i).listings) if @listing= []
          @listing=@listing & Array(Tag.find_by_tag(i).listings)
    end

    respond_to do |format|
        format.js
    end
  end

  def like_results
    @listing=[]
    Listing.all.each do |l|
      @listing=@listing + Array(l) if l.locations.match("#{params[:listing][:locations]}") != nil
    end

    respond_to do |format|
        format.js
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:locations,:prices,:num_of_rooms,:num_of_guests,{avatars:[]})
  end
  def set_listing
    @listing = Listing.find(params[:id]) 
  end
end
