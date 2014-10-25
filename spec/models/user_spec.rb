require 'rails_helper'

describe User do
  before {
    @user = User.new(unique_name: 'Osamushi',
                     mail: 'mad.naname@gmail.com',
                     name: 'おさむし')
  }
  subject { @user }

  it { should respond_to(:unique_name) }
  it { should respond_to(:mail) }
  it { should respond_to(:name) }

  it { should respond_to(:movies) }

  it { should be_valid }

  describe 'ユニーク名について' do
    describe '空だとだめ' do
      before { @user.unique_name = " " }
      it { should_not be_valid }
    end
    describe '20字以下じゃないとだめ' do
      before { @user.unique_name = 'a'*21 }
      it { should_not be_valid }
    end
  end

  describe 'メールアドレスについて' do

    describe '空だとだめ' do
      before { @user.mail = " " }
      it { should_not be_valid }
    end
    describe '重複を許さない' do
      before do
        user_with_same_email = User.new(unique_name: 'Osamushi2', mail: @user.mail.upcase, name: '治虫')
        user_with_same_email.save
      end
      it { should_not be_valid }
    end
    describe 'フォーマットに関して' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.mail = invalid_address
          expect(@user).not_to be_valid
        end
      end
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.mail = valid_address
          expect(@user).to be_valid
        end
      end
    end
  end

  describe '表示名について' do
    describe '空だとだめ' do
      before { @user.name = " " }
      it { should_not be_valid }
    end
  end

  describe '動画のアソシエーション' do
    before { @user.save }
    let!(:older_movie) do
      create(:movie, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_movie) do
      create(:movie, user: @user, created_at: 1.hour.ago)
    end

    it 'user.moviesで得られる配列は新しい順に並ぶ' do
      expect(@user.movies.to_a).to eq [newer_movie, older_movie]
    end

    it 'ユーザーを削除したら投稿動画も一緒に削除されるべき' do
      movies = @user.movies.to_a
      @user.destroy
      expect(movies).not_to be_empty
      movies.each do |movie|
        expect(Movie.where(id: movie.id)).to be_empty
      end
    end

  end
end