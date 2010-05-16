class StartController < ApplicationController
  auto_complete_for :coctail, :name
  auto_complete_for :ingredient, :name
  
  def index
  end

end
