class AddLocationIdToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :location_id, :integer
  end
end