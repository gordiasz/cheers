class CoctailsController < ApplicationController
  auto_complete_for :ingredient, :name
  
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
    elsif @coctails.length == 1
      @coctail = @coctails[0]
      render :show
    else
      render :list
    end
  end
  
  def search_by_ingredients
    ing_ids = params[:ing_ids].split(',')
    ing_ids = ing_ids.map{|id| Integer(id)}.compact
    
    @ingredients = Ingredient.find(ing_ids)
    
    @coctails = Coctail.all(:conditions =>
      ["id in
        (select coctail_id
        from coctails_ingredients
        where ingredient_id in (?)
        group by coctail_id
        having count(ingredient_id) = ?)", ing_ids, ing_ids.length],
      :order => "upper(name)")
    
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
    @coctail.user = current_user
    
    [:ing1, :ing2, :ing3, :ing4, :ing5, :ing6].each do |i|
      ing_name = params[i].strip
      if ing_name.length > 0
        @coctail.ingredients << Ingredient.get_or_create_by_name(ing_name)
      end
    end
    
    respond_to do |format|
      if @coctail.save
        flash[:notice] = 'Drink został dodany.'
        format.html { redirect_to(@coctail) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @coctail = Coctail.find(params[:id])
    @coctail.user = current_user
    
    @coctail.ingredients = []
    
    [:ing1, :ing2, :ing3, :ing4, :ing5, :ing6].each do |i|
      ing_name = params[i].strip
      if ing_name.length > 0
        @coctail.ingredients << Ingredient.get_or_create_by_name(ing_name)
      end
    end
    
    respond_to do |format|
      if @coctail.update_attributes(params[:coctail])
        flash[:notice] = 'Drink został zaktualizowany.'
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
      flash[:notice] = 'Drink został usunięty.'
      format.html { redirect_to(coctails_url) }
    end
  end
  
  def add_rating
    @coctail = Coctail.find(params[:id])
    @coctail.ratings.create(:rating => params[:rating], :user => current_user)
    
    respond_to do |format|
      flash[:notice] = 'Ocena została dodana.'
      format.html { redirect_to(@coctail) }
    end
  end
end
