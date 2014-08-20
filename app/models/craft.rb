class Craft < ActiveRecord::Base
  has_many :items
  belongs_to :theme
end
