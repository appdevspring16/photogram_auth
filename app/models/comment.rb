class Comment < ActiveRecord::Base

belongs_to :photos
belongs_to :users


validates :user_id, :presence => true

validates :photo_id, :presence => true


validates :body, :presence => true

end
