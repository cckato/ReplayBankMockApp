FactoryGirl.define do

  factory :user do
    unique_name 'SampleUser'
    mail 'sampleuser@example.com'
    name '匿名希望さん'
  end

  factory :movie do
    name 'サンプル動画'
    introduction 'サンプル動画についての他愛ない説明文です。ぴょんぴょん。'
    user
  end

  factory :comment do
    body 'ほげふがひげ'
    user
    movie
  end

  factory :commenter1 do
    unique_name 'Commenter1'
    mail 'commenter1@example.com'
    name 'ほたるん'
  end

  factory :commenter2 do
    unique_name 'Commenter2'
    mail 'commenter2@example.com'
    name 'ギルガメッシュ'
  end


end