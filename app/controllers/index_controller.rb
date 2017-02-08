class IndexController < ApplicationController
    def index
        console
                 user = User.create! name: 'Petr' unless user = User.where(name:'Petr').take
                   newdeal = {
                       name: 'Мойка',
                       description: 'Купи купон за 100р и получи мойку за 200р',
                       dealstart: Date.tomorrow,
                       dealend: Date.tomorrow.tomorrow,
                       maximum: 100, # макс. купонов
                       minimum: 10, # мин. купонов
                       dealtype: 'certificate',
                       sellprice: 100, #цена на сайте
                       dealprice: 200, #стоимость самого предложения
                       condition: false, # состояние акции true if coupon.count > minimum
                       discount: nil
                   }

                   newdeal_type2_fixprice = {
                       name: 'Бассейн',
                       description: 'Получи скидку 50% на абонимент в бассейн',
                       dealstart: Date.tomorrow,
                       dealend: Date.tomorrow.tomorrow,
                       maximum: 100, # макс. купонов
                       minimum: 10, # мин. купонов
                       dealtype: 'fixprice',
                       sellprice: 20, #цена на сайте
                       dealprice: 5000, #стоимость самого предложения
                       condition: false, # состояние акции true if coupon.count > minimum
                       discount: 50
                   }

                   newdeal_type3_fixprice = {
                       name: 'Ресторан',
                       description: 'Получи скидку 60% на ужин в ресторане',
                       dealstart: Date.tomorrow,
                       dealend: Date.tomorrow.tomorrow,
                       maximum: 100, # макс. купонов
                       minimum: 10, # мин. купонов
                       dealtype: 'unlimited',
                       sellprice: 150, #цена на сайте
                       dealprice: 5000, #стоимость самого предложения
                       condition: false, # состояние акции true if coupon.count > minimum
                       discount: 60
                   }
         deal = Deal.new.generate newdeal #Создаем новую акцию Мойка
         deal2 = Deal.new.generate newdeal_type2_fixprice #Создаем новую акцию Бассейн
         deal3 = Deal.new.generate newdeal_type3_fixprice #Создаем новую акцию Ресторан
         user.buy deal #Покупка акции
         user.buy deal2 #Покупка акции
         user.buy deal3 #Покупка акции
         benefit = deal.benefit #Выгода по акции
         benefit2 = deal2.benefit #Выгода по акции
         benefit3 = deal3.benefit #Выгода по акции
    end
end
