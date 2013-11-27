require 'spec_helper'

module TrackingNumberValidator
  describe DHLValidator do
    [
      "054655170637",
      "425434057510",
      "425434057526",
      "054655177106",
      "054655177099",
      "217703557591",
      "425434056299",
      "425434056306",
      "2551294465",
      "2551295961",
      "2551295854",
    ].each do |tracking_number|
      it "tracking number: #{tracking_number} should be valid" do
        validator = DHLValidator.new(tracking_number)
        expect(validator).to be_valid
      end
    end
  end
end
