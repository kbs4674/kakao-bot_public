module PostsHelper
    def render_with_hashtags(content)
        content.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "hashtag/#{word.delete("#")}"}.html_safe
    end
end