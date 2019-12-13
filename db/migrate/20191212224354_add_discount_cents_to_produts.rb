class AddDiscountCentsToProduts < ActiveRecord::Migration
  def change
    add_column :products, :discount_cents, :integer
  end
end
