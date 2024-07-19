class AddDomainToShortUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :short_urls, :domain, :string
  end
end
