# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name, null: false
      t.decimal :discount_percentage, null: false
      t.datetime :valid_till, null: false

      t.timestamps
    end
  end
end
