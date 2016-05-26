class Comment < ActiveRecord::
  belongs_to :photo
  belongs_to :user
end
