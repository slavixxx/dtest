class CreateCoupons < ActiveRecord::Migration
    def change
        create_table :coupons do |t|
            t.integer :code_id
            t.integer :user_id

            t.timestamps null: false
        end
    end
end
