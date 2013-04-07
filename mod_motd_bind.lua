local host = module:get_host();
local motd_text = module:get_option_string("motd_text");
local motd_jid = module:get_option_string("motd_jid", host);

if not motd_text then return end

local st = require "util.stanza";
local jid = require "util.jid";

motd_text = motd_text:gsub("^%s*(.-)%s*$", "%1"):gsub("\n%s+", "\n");

module:hook("resource-bind", function(event)
  local session = event.session;
  local jid = jid.join(session.username, session.host);
  local message = st.message({ to = jid, from = motd_jid }, motd_text);
  session.send(message);
  module:log("debug", "MOTD send to user %s", session.full_jid);
end, 1);
