class CreateCodes < ActiveRecord::Migration
    def change
        create_table :codes do |t|
            t.text :code
            t.integer :coupon_id
            t.boolean :sold, default: false
            t.timestamps null: false
        end
    end
end
