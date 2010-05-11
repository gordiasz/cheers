class Coctail < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  
  def self.search(search)
    if search
        find(:all, :conditions => "name LIKE '%#{ search }%'")
    else
        find(:all)
    end
  end
end
