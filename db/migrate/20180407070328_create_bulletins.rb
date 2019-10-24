class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.string :title # 제목
      t.text :content # 내용
      t.string :user_nickname # 유저 닉네임
      t.boolean :opt_admin_only, default: false # 어드민만 글 작성 허용
      t.boolean :opt_email, default: false # 이메일 전송
      t.integer :opt_email_quantity # 이메일 전송 트리거 (댓글이 n개 이상 시 보내지게 하고자 함)
      t.boolean :opt_hashtag, default: false # 해시태그
      t.boolean :opt_post_vote, default: false # 게시글 투표
      t.boolean :opt_comment_vote, default: false # 댓글 투표
      t.boolean :opt_api, default: false # API 센터
      t.integer :user_id #게시글 작성자 정보(유저 번호)

      t.timestamps
    end
  end
end
