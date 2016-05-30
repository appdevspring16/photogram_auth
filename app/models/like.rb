class Like < ActiveRecord::Base

  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id}
  validates :photo_id, :presence => true

  require 'action_view'
  require 'action_view/helpers'
  include ActionView::Helpers::DateHelper

  # belongs_to :user, :class_name => "Like", :foreign_key => "user_id"
end
