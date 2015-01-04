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
end
