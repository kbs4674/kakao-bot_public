class AllNotice < ApplicationRecord
    belongs_to :user
    has_many :impressions, :as=>:impressionable
    
    # cancancan 적용
    resourcify
    
    #게시글이 삭제되도 DB에는 원본 기록이 남아있음.
    acts_as_paranoid
    
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, :content, presence: true
    
    # 댓글
    acts_as_commentable
    
    # 조회수
    is_impressionable
 
    def impression_count
        impressions.size
    end
    
    def unique_impression_count
        # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
        # so getting keys from the hash and calculating the number of keys
        impressions.group(:ip_address).size.keys.length #TESTED
    end
end
