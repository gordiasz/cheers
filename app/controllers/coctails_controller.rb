class CoctailsController < ApplicationController
  # GET /coctails
  def index
    @coctails = Coctail.all
  end

  # GET /coctails/1
  def show
    @coctail = Coctail.find(params[:id])
  end
  
  def search
    @coctails = Coctail.search(params[:query])
  end
  
  def search_by_ingredients
    @coctails = Coctail.search(params[:query])
  end

  # GET /coctails/new
  def new
    @coctail = Coctail.new
  end

  # GET /coctails/1/edit
  def edit
    @coctail = Coctail.find(params[:id])
  end

  # POST /coctails
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

  # PUT /coctails/1
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

  # DELETE /coctails/1
  def destroy
    @coctail = Coctail.find(params[:id])
    @coctail.destroy

    respond_to do |format|
      format.html { redirect_to(coctails_url) }
    end
  end
end
