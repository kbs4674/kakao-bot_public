json.extract! all_notice, :id, :title, :content, :user_id, :created_at, :updated_at
json.url all_notice_url(all_notice, format: :json)
