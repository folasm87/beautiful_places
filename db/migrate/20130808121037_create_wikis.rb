class CreateWikis < ActiveRecord::Migration
  if (!ActiveRecord::Base.connection.tables.include?("wikis"))
    def change
      create_table :wikis do |t|
        t.string :article_location
        t.string :article_url

        t.timestamps
      end
    end
  end

end
