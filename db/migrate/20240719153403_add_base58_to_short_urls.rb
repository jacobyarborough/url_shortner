class AddBase58ToShortUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :base58, :string
    add_index :short_urls, :base58, unique: true
  end
end
