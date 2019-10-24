require "tzinfo"
 
def local(time)
        TZInfo::Timezone.get('Asia/Seoul').local_to_utc(Time.parse(time))
end

every 1.minutes do
  rake "goorm_slack_bot:auto_goorm_qna", :environment => "development"
end