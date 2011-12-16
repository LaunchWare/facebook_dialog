module FacebookDialog
  class Feed
    FACEBOOK_BASE_URL = "http://www.facebook.com/dialog/feed"
    include ActiveModel::Serializers::JSON
    self.include_root_in_json = false

    DEFAULTS = {
      display: "popup"
    }

    #options
    #redirect_uri
    #display
    #from	
    #to
    #message	
    #link	
    #picture	
    #source	
    #name	
    #caption	
    #description	
    #properties	
    #actions	
    #ref	
    def initialize(options = {})
      @options = options
      @options[:app_id] = FacebookDialog.api_key
    end

    def url
      "#{FACEBOOK_BASE_URL}?#{Rack::Utils.build_query(query)}"
    end

    def query
      to_h.merge({ 
        redirect_uri: @options[:redirect_uri] || @options[:link],
        display: @options[:display] || "popup"
      })
    end

    def serializable_hash(options = {})
      to_h.merge({method: :feed})
    end

    HTML_ONLY_KEYS = [:redirect_uri, :display]
    def to_h
      @options.reject{|key, value| HTML_ONLY_KEYS.include?(key) }
    end
  end
end

