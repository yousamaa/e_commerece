class AddUserToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_reference :coupons, :user, foreign_key: true, null: false
  end
end
