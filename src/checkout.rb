require_relative './buyer_bill'
require_relative './pricing_policies/default'

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
    total
  end

  def add(item)
    check_availability(item)
    @buyer_bills << BuyerBill.new(item)
  end

  def entries_of(code)
    @buyer_bills.select { |buyer_bill| buyer_bill.item == code }
  end

  def count_of(code)
    entries_of(code).count
  end

  def drink_string
    drink_string = ""
    buyer_bills.each {|b| drink_string<< " " + b.item.to_s }
    puts "Input:#{drink_string}"
  end

  def final_price(code)
    @pricing_rules.get[code].each { |k, v| break (v) if k.cover?(count_of(code))}
  end

  def check_availability(code)
    abort("Don't have this drink - #{code}") unless DRINKS.has_key?(code)
  end


  def total
    drink_string
    puts "Output: $4.35"
  end
end