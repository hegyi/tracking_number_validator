module TrackingNumberValidator
  class FedExGroundValidator
    WEIGHTINGS = [1, 3, 7]

    attr_reader :tracking_number

    def initialize(tracking_number)
      @tracking_number = tracking_number
    end

    def valid?
      return false unless valid_length?

      reversed = tracking_number.reverse[1...14]

      return false unless reversed.end_with? "00"
      reversed = reversed[0..-3]


      original_check_digit = tracking_number.chars.last.to_i

      sum = 0
      reversed.chars.each_with_index do |char, i|
        sum += WEIGHTINGS[(i) % WEIGHTINGS.size] * char.to_i
      end
      check_digit = (sum % 11) % 10

      original_check_digit == check_digit
    end

    def name
      :fed_ex_ground
    end

    private

    def valid_length?
      tracking_number.length >= 15
    end
  end
end
