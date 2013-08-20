class AddNameToLocImages < ActiveRecord::Migration
  def change
    add_column :loc_images, :name, :string
  end
end