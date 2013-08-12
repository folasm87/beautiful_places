class CreateLocation < ActiveRecord::Migration
  def change
    create_table :location do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
