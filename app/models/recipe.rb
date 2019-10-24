class Recipe < ApplicationRecord
  validates_uniqueness_of :title
end