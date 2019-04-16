require "rspec"
require_relative "../src/checkout"

describe Checkout do
  subject { Checkout.new(PricingPolicies::Default.new) }
  it "prints current total" do
    expect { subject }.to output(
        <<-EOT.gsub(/^\s+/, '')
        Input:
        Output: $0
        EOT
        ).to_stdout
  end

  describe "#add" do
    it "adds drinks to buyer bill with code" do
      subject.add("PC")
      subject.add("PC")
      subject.add("PC")
      expect { subject.total }.to output(
                                      <<-EOT.gsub(/^\s+/, '')
        Input: PC PC PC
        Output: $4.8
                                  EOT
                                  ).to_stdout
    end
  end
end
