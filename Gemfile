source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

#new gem
gem 'webpacker'  , github: 'rails/webpacker'
gem "kaminari"            #ページネーション　（will pagenateという選択肢もある）
gem "faker"               #ありがちなテストデータ作成
gem "autodoc"             #APIテスト時にAPIドキュメントの作成をしてくれる
# for Bootstrap4
gem 'jquery-rails'
#gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap-sass'      #bootstrapのやつ
gem 'device'
gem 'acts-as-taggable-on'
gem "ransack"             #検索機能用の
gem "carrierwave"         #画像アップロード機能用
gem "devise"              #ログイン機能
gem "omniauth"            #ソーシャルアカウントと連携したログイン
gem "acts-as-taggable-on" #タグ機能用の
gem "mysql2"
gem "bcrypt"
gem "rmagick"
gem "mini_magick"
gem "will_paginate"
gem "bootstrap-will_paginate"

gem 'rails', '~> 5.2.3'
#gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "minitest"
  gem "minitest-reporters"  #testようの
  gem "guard"
  gem "guard-minitest"
  gem 'rails-controller-testing'
  
end

group :production do
  gem 'pg',  '0.20.0'
  gem 'fog'
  end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
