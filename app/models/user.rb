class User < ApplicationRecord
  has_many :posts
  has_many :bulletins
  has_many :all_notices
  
  # 투표 Gem 관련
  acts_as_voter
  
  #유저의 기본 권한 설정
  after_create :assign_default_role
  
  # 닉네임 중복 검사
  validates_uniqueness_of :nickname
  
  # 알림
  acts_as_reader
  has_many :new_notifications
  
  # cancancan 적용
  resourcify
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def assign_default_role
    add_role(:normal)
  end
end
