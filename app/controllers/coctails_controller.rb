class CoctailsController < ApplicationController
  def index
    if params[:ingredient_id]
      ing = Ingredient.find(params[:ingredient_id])
      @ingredients = [ing]
      @coctails = ing.coctails
      
      if @coctails.empty?
        render :empty
      else
        render :list_by_ingredients
      end
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
    if @coctails.empty?
      render :empty
    else
      render :list
    end
  end
  
  def search_by_ingredients
    @ingredients = []
    params[:query].split(%r{\W+}).each do |s|
      if s.length > 2
        Ingredient.search(s).each do |i|
          @ingredients.push(i)
        end
      end
    end
    
    @coctails = []
    @ingredients.each do |i|
      @coctails.concat(i.coctails.all)
    end
    
    @coctails.uniq!
    
    if @coctails.empty?
      render :empty
    else
      render :list_by_ingredients
    end
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
