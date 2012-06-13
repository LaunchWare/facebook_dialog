module FacebookDialog
  module ScriptHelper
    def fb_js
      content_tag(:div, "", id: "fb-root") +
      javascript_include_tag('//connect.facebook.net/en_US/all.js')
    end

    def fb_init_js(options = {})
      default_options = {
        appId: FacebookDialog.api_key,
        status: true,
        cookies: true
      }
      "FB.init(#{options.merge(default_options).to_json.html_safe});".html_safe
    end
  end
end

