module FacebookDialog
  class Oauth < Dialog
    self.resource_name = :oauth

    def initialize(options= {})
      super
      @options[:client_id] = @options.delete(:app_id)
    end   
  end
end

