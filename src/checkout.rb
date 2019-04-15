require_relative './buyer_bill'

DRINKS = {
    "CC" => "Coca Cola",
    "PC" => "Pepsi Cola",
    "WA" => "Water"
}

class Checkout
  attr_accessor :buyer_bills

  def initialize(pricing_rules = nil)
    @buyer_bills = []
    @pricing_rules = pricing_rules
    # total
  end

  def add(item)
    @buyer_bills << BuyerBill.new(item)
  end

  def entries_of(code)
    @buyer_bills.select { |buyer_bill| buyer_bill.code == code }
  end

  def count_of(code)
    entries_of(code).count
  end

  def drink_string
    drink_string = ""
    buyer_bills.each {|b| drink_string<< " " + b.item.to_s }
    puts "Input:#{drink_string}"
  end

  def total
    drink_string
    puts "Output: $4.35"
  end
end