## rake "log:log"

namespace :log do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task log: :environment do

    Log.where(created_at: 2.days.ago..Time.current).each do |x|
      x.destroy
    end

  end
end