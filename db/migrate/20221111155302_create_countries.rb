class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :year
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
