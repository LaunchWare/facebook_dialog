#Facebook Dialog

A utility that makes it easy to integrate progressively enhanced facebook dialogs

[![Build Status](https://secure.travis-ci.org/EnlightSolutions/facebook_dialog.png)](http://travis-ci.org/enlightsolutions/facebook_dialog)

This is available for Rails >= 3.0 and Ruby >= 1.9.2

```ruby
  FacebookDialog.api_key = "<your app_id/api key>"
  
  #in a Rails View

  <%- facebook_dialog = FacebookDialog::Feed.new({
      redirect_uri: "http://www.example.com",
      link: "http://www.example.com",
      name: "Want to know?",
      caption: "Something pretty awesome",
      description: "Zomg! You won't believe what I found on the web."
  }) -%>

  <%= link_to "Share on Facebook", facebook_dialog.url, id: "share_on_facebook" %>

  #at the bottom of your page

  <%= fb_js %>
  <%= javascript_tag do %>
    <%= fb_init_js %>
    $("#share_on_facebook").click(function(e){
      FB.ui(<%==  facebook_dialog.to_json %>); 
    });
  <%- end -%>
```

Use with OmniAuth
==

We've created a convenience mechanism for you to use FacebookDialog with [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook).

```ruby
  <%= link_to "Sign In w/ Facebook", FacebookDialog::OmniAuth.dialog.url %>
```

*NOTE*: omniauth-facebook must be loaded prior to facebook_dialog for this to work.

*NOTE*: You must set OmniAuth.config.full_host or a redirect_uri in each invocation for this to work properly. In order to obtain the data we need without coupling to request context, we do some neat/hacky things with Rack.

In an initializer like config/initializers/omniauth.rb:

```ruby
  OmniAuth.full_host = "http://example.com"
```

Alternatively, we provide you 

```ruby
    <%= link_to "Sign In With Facebook", FacebookDialog::OmniAuth.dialog({
      display: "popup",
      redirect_uri: fb_callback_url
    }).url%>
```

fb_callback_url is a convenience method provided by facebook_dialog

Without one of these approaches, your OAuth dialog will not work!

Per Facebook's documentation "The OAuth Dialog should not be called directly from the JavaScript SDK. Rather, use FB.login for this purpose." Thus, this helper should only be used for server side implementations to start.
