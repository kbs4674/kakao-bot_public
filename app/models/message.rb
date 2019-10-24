class Message < ApplicationRecord
  # 투표 Gem 관련
  acts_as_votable
  
  # cancancan 적용
  resourcify
  
  belongs_to :user
  belongs_to :conversation
end