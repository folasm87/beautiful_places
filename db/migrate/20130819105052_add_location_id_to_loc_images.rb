class AddLocationIdToLocImages < ActiveRecord::Migration
  def change
    add_column :loc_images, :location_id, :integer
  end
end