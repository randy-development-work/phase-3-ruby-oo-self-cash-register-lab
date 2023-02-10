require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :price, :quantity, :last_transaction

    def initialize(discount = 0, total = 0)
        @discount=discount
        @total=total
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @title=title
        @price = price*quantity
        @total += @price

        # using quantity to loop through all elements and add them to items
        quantity.times{items.push(title)}
        # (1..quantity).each{items << title}
        @last_transaction = @price
    end

    def apply_discount      
        if discount != 0
            new_total = total * @discount/100
            self.total = total - new_total
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply." 
        end
    end

    def void_last_transaction
        
        @total -= @last_transaction
        

    end
end


pixel = CashRegister.new
puts pixel.add_item("pixel 6a", 47000, 3)
puts pixel.apply_discount
puts pixel.items
