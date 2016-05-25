class Like < ActiveRecord::Base
  validates :photo_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo }
end
