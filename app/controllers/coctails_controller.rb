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
      @coctails = Coctail.all(:order => "upper(name)")
      render :list
    end
  end
  
  def list
    @coctails = Coctail.all(:order => "upper(name)")
  end
  
  def show
    @coctail = Coctail.find(params[:id])
  end
  
  def search
    @coctails = Coctail.search(params[:coctail][:name].strip())
    if @coctails.empty?
      render :empty
    else
      render :list
    end
  end
  
  def search_by_ingredients
    where1 = ""
    where2 = []
    
    params[:query].split(%r{\W+}).each do |s|
      where1 += "name like ? or "
      where2 += s+'%'
    end
    
    where1 = where1[0...-4]
    
    @ingredients = Ingredient.all(:conditions => ["name like ?", 'li%'])
    
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
    
    [:ing1, :ing2, :ing3, :ing4, :ing5, :ing6, :ing7, :ing8].each do |i|
      ing_name = params[i].strip
      if ing_name.length > 0
        @coctail.ingredients << Ingredient.get_or_create_by_name(ing_name)
      end
    end
    
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
