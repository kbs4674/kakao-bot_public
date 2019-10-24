class Invite < ApplicationRecord
  validates_uniqueness_of :code
  belongs_to :user
end
