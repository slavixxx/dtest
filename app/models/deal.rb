class Deal < ActiveRecord::Base
    has_and_belongs_to_many :codes
    has_many :coupons, through: :codes


    def generate(mdeal)
        unless deal = Deal.where(name: mdeal[:name]).take
            deal = Deal.create mdeal
            mdeal[:maximum].times do
                deal.codes.create(code: Array.new(10) { rand(128).to_s(36) }.join) # Для 100% уверенности в уникальности для рабочего приложения можно сравнивать с предыдущими созданными, но сейчас это лишнее.
            end
            deal.save
        end
        deal
    end

    def benefit
        return self.dealprice - self.sellprice if self.dealtype == 'certificate'
        return self.dealprice - (self.dealprice/100*self.discount + self.sellprice) if self.dealtype == 'fixprice'
        return 'unlimited' if self.dealtype == 'unlimited'
    end
end
