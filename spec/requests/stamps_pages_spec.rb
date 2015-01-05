require 'spec_helper'

describe "Stamp Pages" do
  subject { page }

  describe "list page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Stempels') }
    it { should have_selector('title', text: 'Stempels | ' + I18n.t('List')) }

    describe "Without any stamps" do
      before { Stamp.delete_all }

      it { should have_selector('td', text: I18n.t('stamps.none_found')) }
    end

    describe "With at least one stamp" do
      before do
        @stamp = FactoryGirl.create(:stamp)
        visit root_path
      end

      it { should have_selector('td', text: @stamp.brand) }
      it { should have_selector('td', text: @stamp.magazine) }
      it { should have_selector('td.right-align', text: @stamp.page.to_s) }
    end
  end
end
