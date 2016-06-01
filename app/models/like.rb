class Like < ActiveRecord::Base

#not sure about photo_id in scope

  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id }
  validates :photo_id, :presence => true

  belongs_to :user
  belongs_to :photo

end
