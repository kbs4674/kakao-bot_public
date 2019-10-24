namespace :goorm_slack_bot do
  task auto_goorm_qna: :environment do
    
    require 'slack-ruby-client'
    
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end
    
    client = Slack::Web::Client.new
    
    client.chat_postMessage(channel: '#general', text: '안녕하세요, 슬랙 봇 테스트 입니다 :D', as_user: true)
    
  end
end
