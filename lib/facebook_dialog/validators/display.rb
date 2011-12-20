module FacebookDialog
  module Validators
    class Display
      def initialize(options = {})
        @options = options
        @value = options[:display]
      end

      def validate
        validate_against_whitelist
        validate_access_key
      end

      protected
      def validate_against_whitelist
        unless @value.nil? || whitelist.include?(@value.to_s)
          raise error_to_raise, "#{@value} is not a valid display type"
        end
      end

      def validate_access_key
        if @value && @value == "wap" && @options[:access_key].nil?
          raise error_to_raise, "You must specify an access key for wap displays"
        end
      end

      def whitelist
        FacebookDialog.display_modes
      end

      def error_to_raise
        FacebookDialog::InvalidDisplay
      end
    end
  end
end

