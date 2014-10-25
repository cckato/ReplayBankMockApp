namespace :db do

  desc 'Fill database with sample data'
  task add_users: :environment do
    bgarr = ['', '&bgset=bg1', '&bgset=bg2']
    30.times do |n|
      Faker::Config.locale = :en
      unique_name = Faker::Internet.user_name
      mail = Faker::Internet.email
      introduction = Faker::Hacker.say_something_smart
      image_url = "http://robohash.org/#{unique_name}.png?size=200x200#{bgarr[rand(3)]}"
      birth_year = 2015 - (10 + rand(30))
      Faker::Config.locale = :ja
      name = Faker::Name.first_name
      User.create(unique_name: unique_name,
                  mail: mail,
                  name: name,
                  introduction: introduction,
                  remote_image_url: image_url,
                  birth_year: birth_year)
      p unique_name
    end
  end

  task add_movies: :environment do
    bgarr = ['&bgset=bg1', '%bgset=bg2']
    30.times do |n|
      name = Faker::Name.title
      introduction = Faker::Lorem.sentence
      body_url = "http://robohash.org/#{name}.png?set=set3&size=1280x1280&bgset=bg#{rand(2)+1}"
      user = User.order('random()').first
      Movie.create(name: name,
                   introduction: introduction,
                   remote_body_url: body_url,
                   user_id: user.id)
      p name
    end
  end

end