require 'rails_helper'

RSpec.describe 'MoviePages', :type => :request do

  let!(:poster) { create(:user) }
  let!(:movie) { create(:movie, user: poster, name:'マイクラ実況#1') }
  let!(:commenter1) { User.create(unique_name:'Hotarun', name: 'ほたるん', mail: 'hotarun@example.com') }
  let!(:commenter2) { User.create(unique_name:'gil_gam', name: 'ギルガメッシュ', mail: 'Gilgamesh@example.com') }
  let!(:com1) { create(:comment, user: commenter1, movie: movie) }
  let!(:com2) { create(:comment, user: commenter2, movie: movie) }

  before { visit movie_path(movie) }
  subject { page }

  it { should have_content(movie.name) }
  it { should have_content(movie.user.name) }

  describe 'コメント一覧' do
    it { should have_content(com1.body) }
    it { should have_content(com1.user.name) }
    it { should have_content(com2.body) }
    it { should have_content(com2.user.name) }
  end

end