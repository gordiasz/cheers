class CoctailsController < ApplicationController
  def index
    if params[:ingredient_id]
      ing = Ingredient.find(params[:ingredient_id])
      @ingredients = [ing]
      @coctails = ing.coctails
      render :list_by_ingredients
    else
      @coctails = Coctail.all
      render :list
    end
  end
  
  def list
    @coctails = Coctail.all
  end
  
  def show
    @coctail = Coctail.find(params[:id])
  end
  
  def search
    @coctails = Coctail.search(params[:query])
    render :list
  end
  
  def search_by_ingredients
    @coctails = Coctail.search(params[:query])
    render :list
  end
  
  def new
    @coctail = Coctail.new
  end

  def edit
    @coctail = Coctail.find(params[:id])
  end

  def create
    @coctail = Coctail.new(params[:coctail])

    respond_to do |format|
      if @coctail.save
        flash[:notice] = 'Coctail was successfully created.'
        format.html { redirect_to(@coctail) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @coctail = Coctail.find(params[:id])

    respond_to do |format|
      if @coctail.update_attributes(params[:coctail])
        flash[:notice] = 'Coctail was successfully updated.'
        format.html { redirect_to(@coctail) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
    
  def destroy
    @coctail = Coctail.find(params[:id])
    @coctail.destroy

    respond_to do |format|
      format.html { redirect_to(coctails_url) }
    end
  end
end
