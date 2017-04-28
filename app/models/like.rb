class Like < ActiveRecord::Base

  validates :user, :presence => true, :uniqueness => { :scope => :photo }
  validates :photo, :presence => true

  belongs_to :user
  belongs_to :photo

end
