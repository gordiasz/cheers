class Coctail < ActiveRecord::Base
  has_many :coctails_ingredients
  has_many :ingredients, :through => :coctails_ingredients
  has_many :comments
  has_many :ratings
  belongs_to :user
  has_attached_file :photo, :styles => {:thumb=> "100x100#", :small  => "150x150>"}
  
  def self.search(search)
    if search.length > 0
      all(:conditions => ["name LIKE ?", search+'%'], :order => "upper(name)")
    else
      []
    end
  end
end
