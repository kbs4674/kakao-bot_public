class BotFuncRank < ApplicationRecord
    attr_accessor :current_month_hit
    validates_uniqueness_of :title, :scope => [:title, :year]
    
    def self.find_by_data(botTitle, botYear)
        @data = BotFuncRank.where(title: botTitle).find_by(year: botYear)
        puts @data
        
        if @data.nil?
            @dataResult = BotFuncRank.create(title: botTitle, year: Time.zone.now.strftime('%Y'))
            BotFuncRank.update_data_hit(@dataResult)
        else
            BotFuncRank.update_data_hit(@data)
        end
    end
    
    def self.update_data_hit(data)
        @dataResult = data
        
        if Time.zone.now.strftime('%m') == "1"
            @dataResult.update(hit_1: @dataResult.hit_1.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "2"
            @dataResult.update(hit_2: @dataResult.hit_2.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "3"
            @dataResult.update(hit_3: @dataResult.hit_3.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "4"
            @dataResult.update(hit_4: @dataResult.hit_4.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "5"
            @dataResult.update(hit_5: @dataResult.hit_5.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "6"
            @dataResult.update(hit_6: @dataResult.hit_6.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "7"
            @dataResult.update(hit_7: @dataResult.hit_7.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "8"
            @dataResult.update(hit_8: @dataResult.hit_8.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "9"
            @dataResult.update(hit_9: @dataResult.hit_9.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "10"
            @dataResult.update(hit_10: @dataResult.hit_10.to_i+1)
        elsif Time.zone.now.strftime('%m') == "11"
            @dataResult.update(hit_11: @dataResult.hit_11.to_i + 1)
        elsif Time.zone.now.strftime('%m') == "12"
            @dataResult.update(hit_12: @dataResult.hit_12.to_i + 1)
        end
    end
end
