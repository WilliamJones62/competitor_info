class CreateCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :competitors do |t|
      t.string :rep
      t.string :competitor
      t.string :comp_type
      t.string :dart_mkt
      t.string :zip
      t.boolean :direct
      t.date :effective
      t.string :category
      t.string :sub_category
      t.string :description
      t.string :brand
      t.string :sub_brand
      t.string :uom
      t.decimal :weight
      t.decimal :price
      t.decimal :price_lb
      t.boolean :fresh
      t.string :sku
      t.string :dart_desc
      t.decimal :dart_price
      t.decimal :avg_price
      t.string :dart_uom
      t.decimal :list_price_var
      t.decimal :avg_price_var
      t.string :customer
      t.decimal :lb_in_reg
      t.decimal :lb_in_sub_reg
      t.decimal :lb_in_csa
      t.string :source
      t.string :delivery
      t.string :dart_delivery
      t.boolean :abf
      t.boolean :waterchilled
      t.boolean :send_all
      t.string :grade
      t.string :specs
      t.boolean :heritage
      t.string :breed
      t.boolean :grass_fed
      t.boolean :organic

      t.timestamps
    end
  end
end
