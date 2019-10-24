class Bulletin < ApplicationRecord
    has_many :posts, dependent: :destroy
    belongs_to :user
    validates_uniqueness_of :title
    
    # cancancan 적용
    resourcify
    
    #게시글이 삭제되도 DB에는 원본 기록이 남아있음.
    acts_as_paranoid
    
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, :content, presence: true
end
