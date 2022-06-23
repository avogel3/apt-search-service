class AddIndexToPriceHistory < ActiveRecord::Migration[7.0]
  def change
    add_index :price_histories, :price
  end
end
