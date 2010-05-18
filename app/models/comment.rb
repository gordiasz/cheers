class Comment < ActiveRecord::Base
  belongs_to :coctail
  belongs_to :user
end
