require 'rails_helper'

RSpec.describe Movie, :type => :model do
  let(:user) { create(:user) }
  before {
    @movie = user.movies.build(name: 'しょぼんのアクション実況プレイ#1',
                               body: 'http://xxx.com')
  }
  subject { @movie }

  it { should respond_to(:name) }
  it { should respond_to(:introduction) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe 'user_id が空だとだめ' do
    before { @movie.user_id = nil }
    it { should_not be_valid }
  end

  describe '動画名について' do
    describe 'nilだとだめ' do
      before { @movie.name = ' ' }
      it { should_not be_valid }
    end

    describe '31字以上あるとだめ' do
      before { @movie.name = 'a' * 31 }
      it { should_not be_valid }
    end
  end

  describe 'コメントのアソシエーション' do
    before { @movie.save }
    let!(:older_comment) {create(:comment, user: user, movie: @movie, created_at: 1.day.ago)}
    let!(:newer_comment) {create(:comment, user: user, movie: @movie, created_at: 1.hour.ago)}

    it 'movie.commentsで得られる配列は新しい順に並ぶ' do
      expect(@movie.comments.to_a).to eq [newer_comment, older_comment]
    end


  end

end
