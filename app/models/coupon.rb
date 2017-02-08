class Coupon < ActiveRecord::Base
    has_one :code

    before_save :code_status_change
    after_save :check_deal_condition

    def code_status_change
        self.code.sold = true
    end

    def check_deal_condition
        self.code.deals.first.check_condition
    end

end
