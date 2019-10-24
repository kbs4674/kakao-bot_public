class Alarm < ApplicationRecord
  validates_uniqueness_of :title
end