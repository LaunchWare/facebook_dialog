module FacebookDialog
  class Dialog
    include ActiveModel::Serializers::JSON
    self.include_root_in_json = false

    class_attribute :defaults
    class_attribute :resource_name
    self.resource_name = nil
    self.defaults = {}

    def initialize(options = {})
      @options = options
      @options[:app_id] = FacebookDialog.api_key
    end 

    def self.base_uri
      raise ResourceNameNotDefined if resource_name.nil?
      "http://www.facebook.com/dialog/#{resource_name}/"
    end

    def url
      "#{self.class.base_uri}?#{Rack::Utils.build_query(query)}"
    end

    def query
      to_h.merge({ 
        redirect_uri: @options[:redirect_uri] || @options[:link],
        display: @options[:display] || "popup"
      })
    end

    def serializable_hash(options = {})
      to_h.merge({method: self.class.resource_name})
    end

    HTML_ONLY_KEYS = [:redirect_uri, :display]
    def to_h
      validate_options!
      options = @options.merge(self.class.defaults)
      options.reject{|key, value| HTML_ONLY_KEYS.include?(key) }
    end

    protected
    def validate_options!
      FacebookDialog::Validators::Display.new(@options).validate
    end
  end
end

