class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :origin
      t.string :blend_name
      t.integer :price
      t.datetime :sale_date

      t.timestamps
    end
  end
end
