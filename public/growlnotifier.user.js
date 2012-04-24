// ==UserScript==
// @name          Growl Notifications with messages for campfire and fluid
// @namespace     http://tim.theenchanter.com/
// @description   If your name is mentioned in a message, a growl notification shows what was said.
// @author        Tim Harper
// @homepage      http://tim.theenchanter.com/
// @include       *.campfirenow.com/room*
// ==/UserScript==

try {
if ( typeof(Campfire) != "undefined" )
{

  function setCookie(name, value, days) { 
    var expire_str = days ? ";expires="+(new Date(new Date().getTime() + days*24*60*60*1000)).toGMTString() : ""
    var value=(name + "=" + escape(value)) + (expire_str);
    document.cookie = value;
  }
  function getCookie(name) {
    var theCookie;
    $A(document.cookie.split(";")).each(function(c) {
      var parts = c.split("=")
      if (parts[0].toString().strip()==name) 
      {
        theCookie= unescape(parts[1]);
      }
    });
    return theCookie.first ? theCookie.first() : null;
  }

  function notifyError(e)
  {
    console.debug(e);
    new Insertion.Bottom('chat', "<tr><td colspan='2' style='color: red'>A Javascript Error Occurred in the campfire grease monkey script: " + e + "</td></tr>");
  }
  
  Campfire.window_is_focused = false;
  Campfire.currentName = $('user_' + window.chat.userID).down('span').innerHTML;

  Event.observe(window, 'blur', function() { Campfire.window_is_focused = false; });
  Event.observe(window, 'focus', function() { Campfire.window_is_focused = true; });
  
  Object.extend(String.prototype, {
    stripHTML: function() { return(this.replace(/<[^>]+>/g, '').gsub("&gt;", ">").gsub("&lt;", "<").gsub("&amp;", "&")); }
  });
    
  Growler = Class.create();
   
  Growler.prototype = {
    initialize: function() {
        
      this.room = $('room_name').innerHTML;
      this.room_id = this.room.toLowerCase().gsub(/[^a-z0-9]/, "");
      this.showConfigForm();
        try {
      this.loadRoomSettings();
        } catch(e) { notifyError(e) }
      this.populateSettings();

      this.saveRoomSettings(); // Keep the cookie alive
        
    },
    matchesTrigger: function(message) {
      var matcher = this.room_settings.get("trigger").strip();
      if (matcher.empty()) return false
      if (contents = /^\/(.+)\/([a-z]*)$/i.exec(matcher))
        matcher = new RegExp(contents[1], contents[2]);
      else
        matcher = new RegExp("\\b" + matcher + "\\b", "i");
      if (matcher.exec(message)) return true;
      return false;
    },
    growlFor: function(message) {
      if (this.room_settings.get("growl_when") == "always") return true;
      if (this.matchesTrigger(message)) return true;
      return false;
    },
    sendMessage: function(title, name, message) {
      if (! this.growlFor(message)) return false; 
      var alert_message = new String(name + ": " + message).stripHTML();
      fluid.showGrowlNotification({
        title: title,
        description: alert_message,
        priority: 2,
        sticky: this.matchesTrigger(message)
      });
    },
    showConfigForm: function() {
      if ($('growl_config_div')) $('growl_config_div').remove();
      new Insertion.After('participants', "\
      <div id='growl_config_div'>\
      <h3>Growl:</h3>\
      <div id='debug'></div>\
      <form id='growl_form' style='font-size: 10px'>\
        <div><input type='radio' name='growl_when' id='growl_when_always' value='always' /> Always, but stick on trigger</div>\
        <div><input type='radio' name='growl_when' id='growl_when_on_name' value='on_name' /> Only on trigger</div>\
        <div>Trigger: <input type='text' name='trigger' id='growl_trigger'/></div>\
      </form>\
      </div>\
      ");
      that = this;
      $w("growl_when_always growl_when_on_name growl_trigger").each( function(e_id) {
        Event.observe(e_id, 'change', function(e) { this.extractSettings() }.bindAsEventListener(that))
      })
    },
    populateSettings: function() {
      if (this.room_settings.get("growl_when") == "always")
        $('growl_when_always').checked = true
      else
        $('growl_when_on_name').checked = true
      $('growl_trigger').value = this.room_settings.get("trigger");
    },
    extractSettings: function() {
      this.room_settings = $H(Form.serialize('growl_form', true));
      this.saveRoomSettings();
    },
    saveRoomSettings: function() {
      setCookie("growl_settings_" + this.room_id, JSON.stringify(this.room_settings), 14);
    },
    loadRoomSettings: function() {
      if (serialized_settings = getCookie("growl_settings_" + this.room_id))
      {
        eval("this.room_settings = $H(" + JSON.parse(serialized_settings) + ");");   
      }  
      else {
        this.room_settings = $H({
          growl_when: 'always',
          trigger: Campfire.currentName
        });
      }
    }
  }
  
  window.growler = new Growler();

  function notifyMessage(message)
  {
    try {
      message_dom_id = "message_"+message.id();
      if ($(message_dom_id))
      {
        what_node = $$("#" + message_dom_id + " .body div").first();
        name_node = $$("#" + message_dom_id + " .person span").first();
      
        if (what_node && name_node) {
          what = what_node.innerHTML;
          name = name_node.innerHTML;
          growler.sendMessage(document.title, name, what)
        }
      }
    } catch(e) { notifyError(e) }
  }

  // hook into the onMessagesInserted function
  if (typeof( Campfire.Transcript.prototype.insertMessages_without_hook ) == "undefined" ) Campfire.Transcript.prototype.insertMessages_without_hook = Campfire.Transcript.prototype.insertMessages;
  Campfire.Transcript.prototype.insertMessages = function() {
    try {
      messages = this.insertMessages_without_hook.apply(this, arguments);
      messages.each(function(message) {
        if ((! Campfire.window_is_focused) && (message) ) notifyMessage(message);
      })
    
      return messages;
    } catch(e) { notifyError(e); }
  }  
} else {
  console.debug("not installing - no Campfire defined");
}
} catch(e) {
  new Insertion.After('participants', e);
  console.debug(e);
}

