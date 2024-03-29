# frozen_string_literal: true

class AddUserRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true, null: false
  end
end
