module FacebookDialog
  class OptionSerialization
    def initialize(options)
      @options = options
    end

    def serialized_hash
      @serialized_options = @options.dup
      options_to_serialize.each do |option_key|
        if @serialized_options[option_key] && @serialized_options[option_key].kind_of?(Array)
          @serialized_options[option_key] = @serialized_options[option_key].map{|i| i.to_s}.join(",")
        end
      end

      @serialized_options
    end
    protected
    def options_to_serialize
      [
        :response_type,
        :scope
      ]
    end
  end
end

