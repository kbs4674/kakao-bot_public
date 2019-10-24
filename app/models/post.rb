class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :bulletin
    belongs_to :user
    
    # 해시태그 DB 모델관계 설정
    has_and_belongs_to_many :tags
    
    # 게시글이 삭제되도 DB에는 원본 기록이 남아있음.
    acts_as_paranoid
    
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, :content, presence: true
    
    # 댓글
    acts_as_commentable
    
    # 조회수
    is_impressionable
    
    # 투표 Gem 관련
    acts_as_votable
    
    # cancancan 적용
    resourcify
    
    after_create do
        post = Post.find_by(id: self.id)
        hashtags = self.content.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'), bulletin_id: bulletin.id)
            post.tags << tag
        end
    end
    
    before_update do
        post = Post.find_by(id: self.id)
        post.tags.clear
        hashtags = self.content.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'), bulletin_id: bulletin.id)
            post.tags << tag
        end
    end

    # 이미지를 가진 게시글 삭제 시 AWS S3서버에도 자동 삭제처리
    before_destroy :destroy_assets

    def destroy_assets
        self.image.remove! if self.image
        self.save!
    end
end