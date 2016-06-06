class Like < ActiveRecord::Base

    # Validation
    validates :user, :presence => true, :uniqueness => { :scope => :photo }
    validates :photo, :presence => true

    # Associations

    # a like belongs to a user
    belongs_to :user
    # a like belongs to a photo
    belongs_to :photo
end
