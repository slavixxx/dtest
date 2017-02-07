class User < ActiveRecord::Base
    has_many :coupons

    def buy deal
        if deal.coupons.length < deal.maximum
            c = self.coupons.new
            deal.codes.where(sold:false).first.coupon = c
            c.save
        end
    end

end
