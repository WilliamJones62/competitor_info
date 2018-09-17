class RemoveCbsaNamemeFromCompetitorInfoPrices < ActiveRecord::Migration[5.1]
  def change
    remove_column :competitor_info_prices, :cbsa_nameme, :e
  end
end
