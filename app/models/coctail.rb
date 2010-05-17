class Coctail < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :comments
  has_many :ratings
  has_attached_file :photo, :styles => {:thumb=> "100x100#", :small  => "150x150>"}
  
  def self.search(search)
    if search.length > 0
      all(:conditions => ["name LIKE ?", search+'%'], :order => "upper(name)")
    else
      []
    end
  end
end
