class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  validates :user_id, presence: true
  validates :user_id, uniqueness: {scope: :photo_id}
  validates :photo_id, presence: true
end
