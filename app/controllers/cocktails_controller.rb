class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    p cocktail_params[:external_photo_url]
    if @cocktail.update(cocktail_params)
      set_external_photo(@cocktail)
      redirect_to cocktail_path(@cocktail)
    else
      render :show
    end
  end

  private

  def set_external_photo(cocktail)
    cocktail.photo_url = cocktail_params[:external_photo_url] unless cocktail_params[:external_photo_url].blank?
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :external_photo_url)
  end
end
