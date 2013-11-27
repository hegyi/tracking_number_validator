require 'spec_helper'

module TrackingNumberValidator
  describe Service do
    describe "#detect" do
      it "detects DHL" do
        expect(Service.detect("425434056299")).to eq :dhl
        expect(Service.detect("2551295854")).to eq :dhl
        expect(Service.detect("1010095723370011934800578986681571")).to eq :fed_ex_ground
        expect(Service.detect("foooo")).to eq nil
      end

      it "sanitizes the input" do
        expect(Service.detect("   425434056299   ")).to eq :dhl
        expect(Service.detect("_425434056299_")).to eq :dhl
      end
    end
  end
end
