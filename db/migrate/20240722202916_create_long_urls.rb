class CreateLongUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :long_urls do |t|
      t.string :url

      t.timestamps
    end
    add_index :long_urls, :url
  end
end
