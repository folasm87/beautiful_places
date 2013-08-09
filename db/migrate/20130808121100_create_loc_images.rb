class CreateLocImages < ActiveRecord::Migration
  if (!ActiveRecord::Base.connection.tables.include?("loc_images"))
    def change
      create_table :loc_images do |t|
        t.string :image_location
        t.string :image_url

        t.timestamps
      end
    end
  end
end
