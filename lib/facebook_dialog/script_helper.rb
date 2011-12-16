module FacebookDialog
  module ScriptHelper
    def facebook_js
      content_tag(:div, "", id: "fb-root") +
      javascript_include_tag('http://connect.facebook.net/en_US/all.js')
    end

    def fb_init_js
      "FB.init({
        appId: '#{FacebookDialog.api_key}',
        status: true,
        cookies: true
      });".html_safe
    end
  end
end

