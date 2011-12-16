#Facebook Dialog

A utility that makes it easy to integrate progressively enhanced facebook dialogs

```@ruby
  FacebookDialog.api_key = "<your app_id/api key>"
  
  #in a Rails View
  <%= link_to "Share on Facebook" FacebookDialog::Feed.new({
      redirect_uri: "http://www.example.com",
      caption: "Something pretty awesome",
      description: "Zomg! You won't believe what I found on the web."
    }), 
    id: "share_on_facebook" %>

  <%= facebook_js %>
  <%= javascript_tag do %>
    <%= fb_init_js %>
    $("#share_on_facebook").click(function(e){
      FB.ui(<%==  Facebook::TopicShareUrl.new(resource).to_json %>); 
    });
  <%- end -%>
```

