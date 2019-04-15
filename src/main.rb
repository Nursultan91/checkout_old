require_relative 'checkout'

ewq = Checkout.new
5.times { ewq.add("asd") }
ewq.total

dsa = Checkout.new
dsa.total