# frozen_string_literal: true

class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :name, unique: true
  end
end
