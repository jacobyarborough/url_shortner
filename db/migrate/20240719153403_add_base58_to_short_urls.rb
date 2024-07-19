class AddBase58ToShortUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :base58, :string
  end
end
