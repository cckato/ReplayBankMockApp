require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do

  subject {page}

  describe 'Home page' do
    before {visit root_path}
    it { should have_content('ReplayBank') }
  end

  describe 'Help page' do
    before {visit help_path}
    it { should have_content('ヘルプ') }
  end
end
