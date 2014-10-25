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

end