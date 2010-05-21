class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.paginate :page => params[:page], :per_page => 10,
       :order => 'updated_at DESC'
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(params[:ingredient])

    respond_to do |format|
      if @ingredient.save
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
