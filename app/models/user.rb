class User < ActiveRecord::Base
    has_many :coupons

    def buy deal, u=self
        if deal.is_open?
            c = u.coupons.new
            deal.codes.where(sold:false).first.coupon = c
            c.save
            return deal.reload.coupons.length
        else
            return false
        end
    end

end
