# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: '', unique: true
      t.integer :price, null: false, default: 0
      t.string :description, null: false, default: ''

      t.timestamps
    end
  end
end
