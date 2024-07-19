class CreateShortUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :short_urls do |t|
      t.bigint :identifier
      t.string :short_url
      t.references :long_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
