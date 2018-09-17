class AddTotalLbsToCompetitorInfoPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :competitor_info_prices, :total_lbs, :float
  end
end
