require 'rails_helper'

RSpec.describe "UserPages", :type => :request do

  describe 'プロフィールページ' do
    let(:user) { create(:user) }
    let!(:m1) { create(:movie, user:user, name:'マイクラ実況#1') }
    let!(:m2) { create(:movie, user:user, name:'マイクラ実況#2') }

    before { visit user_path(user) }
    subject { page }

    it { should have_content(user.name) }
    it { should have_content(user.unique_name) }
    # it { should have_title(user.name) }

    describe '投稿動画一覧' do
      it { should have_content(m1.name) }
      it { should have_content(m2.name) }
      it { should have_content(user.movies.count) }
    end

  end

end
