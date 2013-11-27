module TrackingNumberValidator
  class Service

    VALIDATORS = [
      DHLValidator,
      FedExGroundValidator
    ]

    def self.detect(tracking_number)
      tracking_number = sanitize(tracking_number)
      VALIDATORS.each do |validator|
        validator = validator.new(tracking_number)
        return validator.name if validator.valid?
      end
      nil
    end

    private
    def self.sanitize(tracking_number)
      tracking_number[/\d+/] || ""
    end
  end
end
