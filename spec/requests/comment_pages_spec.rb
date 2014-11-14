require 'rails_helper'

RSpec.describe 'CommentPages', :type => :request do

  subject {page}

  let(:user) { create(:user) }
  let!(:movie) { create(:movie, user: user) }

  describe 'コメント生成' do
    before { visit movie_path(movie) }

    describe 'with invalid information' do
      it 'should not create a comment' do
        expect { click_button '投稿' }.not_to change(Comment, :count)
      end
    end

    describe 'error messages' do
      before { click_button '投稿' }
      it { should have_content('エラー') }
    end

    describe 'with valid information' do
      before { fill_in 'comment_body', with: 'あぁ＾〜こころがびょんぴょんするんじゃあ＾〜' }
      it 'should create a comment' do
        expect { click_button '投稿' }.to change(Comment, :count).by(1)
      end
    end

  end


end