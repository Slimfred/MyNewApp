class ChangePriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price_in_cents, :integer
  end
end
