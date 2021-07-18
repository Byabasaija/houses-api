class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
