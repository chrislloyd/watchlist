class Film < ActiveRecord::Base
  default_scope :order => "position ASC"
  attr_accessible :date, :position, :status, :title
  belongs_to :user
end
