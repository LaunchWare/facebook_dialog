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

