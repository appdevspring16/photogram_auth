class Like < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: {scope: :photo}
  validates :photo_id

  belongs_to :user
  belongs_to :comment
end
