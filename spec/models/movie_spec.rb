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
    describe '空だとだめ' do
      before { @movie.name = ' ' }
      it { should_not be_valid }
    end

    describe '31字以上あるとだめ' do
      before { @movie.name = 'a' * 31 }
      it { should_not be_valid }
    end
  end

end
