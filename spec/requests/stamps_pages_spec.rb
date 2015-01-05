require 'spec_helper'

describe "Stamp Pages" do
  subject { page }

  describe "index page" do
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

  describe "new page" do
    before { visit new_stamp_path }

    it { should have_selector('h1' , text: I18n.t('stamps.new_stamp')) }
    it { should have_selector('title', text: I18n.t('stamps.new_stamp')) }
  end

  describe "Creating a stamp" do
    before { visit new_stamp_path }

    let(:submit) { "save" }

    describe "with invalid information" do
      it "should not create a stamp" do
        expect { click_button submit }.not_to change(Stamp, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: I18n.t('stamps.new_stamp')) }
        it { should have_selector('div.alert.alert-danger') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "stamp_brand", with: "Bar"
        fill_in "stamp_magazine", with: "Craft stamper"
        fill_in "stamp_page", with: "11"
      end

      it "should create a stamp" do
        expect { click_button submit }.to change(Stamp, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:stamp) do
          Stamp.find(brand: "Bar", magazine: "Craft stamper", page: 11)
        end

        it { should have_selector('td', text: "Bar") }
        it { should have_selector('td', text: "Craft stamper") }
        it { should have_selector('td.right-align', text: "11") }
        it { should have_selector('div.alert.alert-success',
                                  text: I18n.t('stamps.created'))}
      end
    end
  end
end
