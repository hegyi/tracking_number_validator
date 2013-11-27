module TrackingNumberValidator
  class DHLValidator
    attr_reader :tracking_number

    VALID_LENGTHS = [10, 12, 14]
    WEIGHTINGS = [4, 9]

    def initialize(tracking_number)
      @tracking_number = tracking_number
    end

    def valid?
      return false unless valid_length?
      if tracking_number.length == 10
        calculate_modulo_7
      else
        calculate_modulo_10
      end
    end

    def name
      :dhl
    end

    private

    def calculate_modulo_7
      characters = tracking_number.chars
      without_checksum = characters[0..-2]
      remainder = without_checksum.join.to_i % 7
      characters.last.to_i == remainder
    end

    def calculate_modulo_10
      characters = tracking_number.chars

      sum = 0
      (characters.size - 1).times do |i|
        sum += WEIGHTINGS[i % WEIGHTINGS.size] * characters[i].to_i
      end

      check_digit = ((sum / 10.0).ceil * 10) - sum
      characters.last.to_i == check_digit
    end

    def valid_length?
      VALID_LENGTHS.include? tracking_number.size
    end

  end

end
