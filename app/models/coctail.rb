class Coctail < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :comments
  has_many :ratings
  
  def self.search(search)
    if search
        find(:all, :conditions => "name LIKE '%#{ search }%'")
    else
        find(:all)
    end
  end
end
