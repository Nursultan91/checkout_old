module PricingPolicies
  class Default
    def get
      {
          "CC" => {0..1 => 1.5, 2..Float::INFINITY => 0.75 },
          "PC" => {0..2 => 2, 3.. => 1.60 },
          "WA" => { 0..Float::INFINITY => 0.85 }
      }
    end
  end
end