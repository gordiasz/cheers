class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all(:order => "upper(name)")
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(params[:ingredient])

    respond_to do |format|
      if @ingredient.save
        flash[:notice] = 'Ingredient was successfully created.'
        format.html { redirect_to(@ingredient) }
      else
        format.html { render :action => "new" }
      end
    end
  end
    
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(ingredients_url) }
    end
  end
end
