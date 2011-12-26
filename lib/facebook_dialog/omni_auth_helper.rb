module FacebookDialog
  module OmniAuthHelper
    #this is a convenience method we add to decouple dialogs from controller/request context
    def fb_callback_url
      uri = URI.parse(request.url.gsub(/\?.*$/,''))
      uri.path = "/auth/facebook/callback"
      uri.query = nil
      uri.to_s
    end
  end
end
