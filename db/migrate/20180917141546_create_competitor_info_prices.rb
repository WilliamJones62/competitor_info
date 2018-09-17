class CreateCompetitorInfoPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :competitor_info_prices do |t|
      t.string :part_code
      t.date :sale_date
      t.string :cbsa_nameme
      t.string :csa_name
      t.string :div_name
      t.float :sales_dol
      t.float :average_price
      t.float :tototal_lbs
      t.float :qty_sold
      t.string :price_id
      t.float :part_price
      t.string :uom

      t.timestamps
    end
  end
end
