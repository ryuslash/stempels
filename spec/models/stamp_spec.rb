# == Schema Information
#
# Table name: stamps
#
#  id         :integer          not null, primary key
#  brand      :string(255)
#  magazine   :string(255)
#  page       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Stamp do
  before { @stamp = Stamp.new(brand: 'Foo', magazine: 'Craft stamper',
                              page: 10) }
  subject { @stamp }

  it { should respond_to(:brand) }
  it { should respond_to(:magazine) }
  it { should respond_to(:page) }

  it { should be_valid }

  describe "When brand is empty" do
    before { @stamp.brand = ' ' }
    it { should_not be_valid }
  end

  describe "When magazine is empty" do
    before { @stamp.magazine = ' '}
    it { should_not be_valid }
  end

  describe "When page is empty" do
    before { @stamp.page = nil }
    it { should_not be_valid }
  end

  describe "When page is not a number" do
    before { @stamp.page = 'foo' }
    it { should_not be_valid }
  end

  describe "When page is less than one" do
    before { @stamp.page = 0 }
    it { should_not be_valid }
  end

  describe "When a brand already appears on a magazine's page" do
    before do
      same_stamp = @stamp.dup
      same_stamp.save
    end

    it { should_not be_valid }
  end

  describe "When only the brand changes" do
    before do
      same_stamp = @stamp.dup
      same_stamp.brand = 'Bar'
      same_stamp.save
    end

    it { should be_valid }
  end

  describe "When only the magazine changes" do
    before do
      same_stamp = @stamp.dup
      same_stamp.magazine = 'Some other magazine'
      same_stamp.save
    end

    it { should be_valid }
  end

  describe "When only te page changes"do
    before do
      same_stamp = @stamp.dup
      same_stamp.page = 11
      same_stamp.save
    end

    it { should be_valid }
  end

  describe "When the brand or magazine change case" do
    before do
      same_stamp = @stamp.dup
      same_stamp.magazine = @stamp.magazine.upcase
      same_stamp.brand = @stamp.brand.upcase
      same_stamp.save
    end

    it { should_not be_valid }
  end

  describe "When the brand is too long" do
    before { @stamp.brand = 'a' * 101 }
    it { should_not be_valid }
  end

  describe "When the magazine name is too long" do
    before { @stamp.magazine = 'a' * 101 }
    it { should_not be_valid }
  end
end
