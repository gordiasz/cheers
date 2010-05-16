class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :coctails
  
  def self.search(search)
    if search.length > 0
      all(:conditions => ["name LIKE ?", search+'%'], :order => "upper(name)")
    else
      []
    end
  end
  
  def self.get_or_create_by_name(name)
    ing = Ingredient.first(:conditions => ["name = ?", name])
    if ing == nil
      ing = Ingredient.new
      ing.name = name
      ing.save
    end
    return ing
  end
end
