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

class Stamp < ActiveRecord::Base
  attr_accessible :brand, :magazine, :page
end
