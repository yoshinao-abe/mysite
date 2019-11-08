User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

25.times do
  content = Faker::Lorem.sentence(word_count: 5)
  tag = "ドラゴンクエスト"
  users.each { |user| user.microposts.create!(content: content, tag_list: tag) }
end

15.times do
  content = Faker::Lorem.sentence(word_count: 5)
  tag = "ポケモン"
  users.each { |user| user.microposts.create!(content: content, tag_list: tag) }
end

10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  tag = "モンスターハンター"
  users.each { |user| user.microposts.create!(content: content, tag_list: tag) }
end

#リレーションシップ
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
