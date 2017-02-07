class Coupon < ActiveRecord::Base
    has_one :code
    before_save :code_status_change

    def code_status_change
        self.code.sold = true
    end

end
