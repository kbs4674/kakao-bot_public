source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
##  gem 'therubyracer', platforms: :ruby
gem 'mini_racer', platforms: :ruby # 기존의 therubyracer 보다 가볍다고 함.

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3-static', :group => :development # Ruby 버전에 맞는 sqlite3을 설치해줍니다.
  gem 'sqlite3', '< 1.4', :group => :development # 19. 7. 7 기준으로 sqlite3을 설치 시 1.4.1 버전의 Gem이 설치가 되는데 버전이 윈도우랑 안맞아서 문제가 발생하게 됩니다.
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # rails_db (DB구조를 볼 수 있게.)
  gem 'rails_db', :group => :development
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Heroku / AWS
gem 'pg', :group => :production
gem 'sprockets', '~>3.7.2', :group => :production
gem 'rest-client', :group => :production

# jquery
gem 'jquery-rails'

# devise(회원가입)
gem 'devise', git: 'https://github.com/plataformatec/devise.git'

# devise 한글 번역
gem 'devise-i18n'

# cancancan + rolify (권한등급 설정)
gem 'cancancan'
gem 'rolify'

# 게시글이 삭제되도 DB에 기록은 남김.
#http://blog.naver.com/kbs4674/221052897085
gem 'paranoia'

# Figaro(코드 보안)
gem 'figaro'

# rails_admin : 관리자 페이지
gem 'rails_admin'

# kaminari : 게시판 목록
gem 'kaminari'

# Tinymce : 게시글 에디터
gem 'tinymce-rails'

# impressionist : 조회수
gem 'impressionist'

# 댓글
gem 'acts_as_commentable_with_threading'

# 알림
gem 'unread'

# 투표
gem 'acts_as_votable'

# 이메일 전송
gem 'mailgun_rails'

# 크롤링(세션)
gem 'mechanize'

gem 'net-http-persistent', '~> 2.9.4'

# 이미지 업로드
gem 'carrierwave'

# selenium 관련
gem 'chromedriver-helper'
gem 'webdrivers'
gem 'selenium-webdriver'