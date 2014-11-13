require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:user) { create(:user) }
  let!(:m1) { create(:movie, user:user, name:'マイクラ実況#1') }
  let!(:m2) { create(:movie, user:user, name:'マイクラ実況#2') }
  before {
    @comment = m1.comments.build(body: 'ほげふがひげ', movie_id: m1.id)
  }

  subject { @comment }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:movie_id) }
  it { should respond_to(:user) }
  it { should respond_to(:movie) }

  describe 'user_idが空のとき' do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe 'movie_idが空のとき' do
    before { @comment.movie_id = nil }
    it { should_not be_valid }
  end

  describe 'コメントの長さについて' do

    describe '最大200字まで' do
      before { @comment.body = 'あ' * 201 }
      it { should_not be_valid }
    end

    describe 'nilだとだめ' do
      before { @comment.body = nil }
      it { should_not be_valid }
    end

    describe '空白だとだめ' do
      before { @comment.body = ' ' }
      it { should_not be_valid }
    end

  end
end
