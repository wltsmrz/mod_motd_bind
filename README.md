#mod_motd_bind

This module replaces `mod_motd` module for [Prosody](http://prosody.im/) XMPP server. It has the same functionality; it differs only in that it listens for `resource-bind` rather than `presence/bare`. This means that you can use it with `presence` module disabled, as it is not dependent on any presence stuff.

###Usage

+ Clone this repository into your `plugins` directory
+ Add `motd_bind` to enabled modules list of `prosdy.cfg.lua`
+ Make sure that `motd` is commented or disabled
+ Set a config property `motd_message = "My message"`
+ Done
