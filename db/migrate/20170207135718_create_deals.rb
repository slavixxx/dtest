class CreateDeals < ActiveRecord::Migration
    def change
        create_table :deals do |t|
            t.text :name
            t.text :description
            t.datetime :dealstart
            t.datetime :dealend
            t.integer :maximum
            t.integer :minimum
            t.text :dealtype
            t.integer :sellprice
            t.integer :dealprice
            t.integer :discount
            t.boolean :condition

            t.timestamps null: false
        end
    end
end
