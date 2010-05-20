class User < ActiveRecord::Base
  has_many :coctails
  has_many :comments
  has_many :ratings
  attr_accessible :login, :email, :password, :password_confirmation
  
  acts_as_authentic do |c|    
    c.validates_uniqueness_of_login_field_options= {:case_sensitive => true}
    c.validates_uniqueness_of_email_field_options= {:case_sensitive => true}
  end
end
