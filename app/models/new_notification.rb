class NewNotification < ApplicationRecord
    belongs_to :user
    acts_as_readable on: :created_at
    
    #validates_uniqueness_of :from
end
