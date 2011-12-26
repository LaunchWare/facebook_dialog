module FacebookDialog
  class Oauth < Dialog
    self.resource_name = :oauth

    def initialize(options= {})
      super
      @options[:client_id] = @options.delete(:app_id)
    end   

    def scope
      @options[:scope]
    end
  end
end

