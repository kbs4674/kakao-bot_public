# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ## 테스트 계정 생성(어드민 권한 O)
test1 = User.create( email: 'test4674@naver.com', password: 'a496052', nickname: 'nil', admin: true, invite_code: "1fdgxczxc69dc63a421232szxx", invite_id: 1, invite_group: "vip")
user = User.find(1)
user.add_role :admin

## 데이터 테스트용
# for num in 1..50000
#     AllNotice.create( title: "#{num}", content: "안녕#{num+2}", global_notice: 'false', local_notice: 'false', user_nickname: "어드민", user_id: "1" )
# end