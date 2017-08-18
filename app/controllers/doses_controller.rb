class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    # @doses = Dose.where(cocktail_id: params[:id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      redirect_to doses_path
    else
      render :index
    end

    # TODO: make it on cocktails#show view
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
