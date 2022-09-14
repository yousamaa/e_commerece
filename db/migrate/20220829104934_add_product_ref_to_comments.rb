# frozen_string_literal: true

class AddProductRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :product, foreign_key: true, null: false
  end
end
