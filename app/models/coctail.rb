class Coctail < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :comments
  has_many :ratings
  
  def self.search(search)
    if search.length > 0
      find(:all, :conditions => ["name LIKE ?", search+'%'])
    else
      []
    end
  end
end
