require "rspec"
require_relative "../src/checkout"

describe Checkout do
  subject { Checkout.new }
  it "prints current total" do
    expect { subject }.to output(
        <<-EOT.gsub(/^\s+/, '')
        Input:
        Output: $4.35
        EOT
        ).to_stdout
  end

  describe "#add" do
    it "adds drinks to buyer bill with code" do
      subject.add("PC")
      subject.add("CC")
      subject.add("CC")
      expect { subject.total }.to output(
                                      <<-EOT.gsub(/^\s+/, '')
        Input: PC CC CC
        Output: $4.35
                                  EOT
                                  ).to_stdout
    end
  end
end
