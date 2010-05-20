class User < ActiveRecord::Base
  has_many :coctails
  has_many :comments
  has_many :ratings
  attr_accessible :login, :email, :password, :password_confirmation

  named_scope :with_role, lambda { 
    |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} 
  }

  ROLES = %w[admin moderator author]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  def role?(role)
    roles.include? role.to_s
  end

  
  acts_as_authentic do |c|    
    c.validates_uniqueness_of_login_field_options= {:case_sensitive => true}
    c.validates_uniqueness_of_email_field_options= {:case_sensitive => true}
  end
end
