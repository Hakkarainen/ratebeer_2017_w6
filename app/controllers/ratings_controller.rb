class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
    @recent = Rating.recent
    @beers = Beer.top(3)
    @breweries = Brewery.top(3)
    @styles = Style.top(3)
    @users = User.top(3)
  end

  def new
    @rating = Rating.new
    @rating.save
    @beers = Beer.all
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating  ## virheen aiheuttanut rivi
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end
  
  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end  
end