require 'spec_helper'

describe "Stamp Pages" do
  subject { page }

  describe "list page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Stempels') }
    it { should have_selector('title', text: 'Stempels | ' + I18n.t('List')) }
  end
end
