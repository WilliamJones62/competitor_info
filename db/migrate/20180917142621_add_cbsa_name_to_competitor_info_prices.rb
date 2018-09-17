class AddCbsaNameToCompetitorInfoPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :competitor_info_prices, :cbsa_name, :string
  end
end
