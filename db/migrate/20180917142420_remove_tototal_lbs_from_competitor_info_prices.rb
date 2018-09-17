class RemoveTototalLbsFromCompetitorInfoPrices < ActiveRecord::Migration[5.1]
  def change
    remove_column :competitor_info_prices, :tototal_lbs, :float
  end
end
