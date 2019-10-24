class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title # 제목
      t.text :content # 내용
      t.string :api_string
      t.string :api_json
      t.boolean :api_student, default: false
      t.string :image
      t.string :user_nickname # 유저 닉네임
      t.string :email # 이메일 주소 적는 란(이메일 전송 게시판에서 쓰이는 Attribute)
      t.integer :user_id # 게시글 작성자 정보(유저 번호)

      t.timestamps
    end
  end
end
