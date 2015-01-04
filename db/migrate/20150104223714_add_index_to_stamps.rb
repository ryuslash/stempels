class AddIndexToStamps < ActiveRecord::Migration
  def change
    add_index :stamps, [:brand, :magazine, :page], uniqueness: true
  end
end
