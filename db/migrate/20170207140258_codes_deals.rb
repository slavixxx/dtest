class CodesDeals < ActiveRecord::Migration
  def change
      create_table :codes_deals, id: false do |t|
          t.belongs_to :code, index: true
          t.belongs_to :deal, index: true
      end
  end
end
