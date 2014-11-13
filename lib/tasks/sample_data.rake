require 'net/http'
require 'uri'
require 'json'

namespace :db do

  desc 'Fill database with sample data'
  task add_robot_users: :environment do
    bgarr = ['', '&bgset=bg1', '&bgset=bg2']
    30.times do |n|
      image_url = "http://robohash.org/#{unique_name}.png?size=200x200#{bgarr[rand(3)]}"
      gen_user(image_url)
    end
  end

  task add_real_users: :environment do
    30.times do |n|
      json = Net::HTTP.get(URI.parse('http://uifaces.com/api/v1/random'))
      result = JSON.parse(json)
      image_url = result['image_urls']['epic']
      gen_user(image_url)
    end
  end

  def gen_user(image_url)
    Faker::Config.locale = :en
    unique_name = Faker::Internet.user_name
    mail = Faker::Internet.email
    introduction = Faker::Hacker.say_something_smart
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


  task add_movies: :environment do
    30.times do |n|
      name = Faker::Name.title
      introduction = Faker::Lorem.sentence
      body_url = "http://placeimg.com/640/360/any"
      user = User.order('random()').first
      Movie.create(name: name,
                   introduction: introduction,
                   remote_body_url: body_url,
                   user_id: user.id)
      p name
    end
  end

  task add_comments: :environment do
    100.times do |n|
      user = User.order('random()').first
      movie = Movie.reorder('random()').first
      body = Faker::Lorem.paragraph(2)
      Comment.create(user: user, movie: movie, body: body)
      p n
    end
  end

end