require_relative 'checkout'
require_relative './pricing_policies/default'

ewq = Checkout.new(PricingPolicies::Default.new)
3.times { ewq.add("PC") }
ewq.total

asd = Checkout.new(PricingPolicies::Default.new)
asd.total


# puts ewq.buyer_bills.last.item
#
# puts ewq.count_of("PC")
# puts ewq.final_price("PC")
