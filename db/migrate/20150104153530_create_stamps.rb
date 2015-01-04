class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :brand
      t.string :magazine
      t.integer :page

      t.timestamps
    end
  end
end
