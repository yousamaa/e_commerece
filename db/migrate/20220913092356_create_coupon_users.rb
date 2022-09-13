class CreateCouponUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_users do |t|
      t.belongs_to :user
      t.belongs_to :coupon

      t.timestamps
    end
  end
end
