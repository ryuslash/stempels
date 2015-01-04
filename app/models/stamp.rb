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

  before_save do
    brand.capitalize!
    magazine.capitalize!
  end

  validates :brand, presence: true,
            length: { maximum: 100 },
            uniqueness: {
              scope: [:magazine, :page],
              message: I18n.t("should only appear on a page once")
            }

  validates :magazine, presence: true, length: { maximum: 100 }
  validates :page, presence: true, numericality: { greater_than: 0 }
end
