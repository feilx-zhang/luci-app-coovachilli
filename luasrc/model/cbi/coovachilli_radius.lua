--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--


m = Map("coovachilli")

-- radius server
s1 = m:section(TypedSection, "radius", "Radius设置")
s1.anonymous = true

s1:option( Value, "radiusserver1", translate("radiusserver1") )
s1:option( Value, "radiusserver2", translate("radiusserver2") )
s1:option( Value, "radiussecret", translate("radiussecret") ).password = true

s1:option( Value, "radiuslisten", translate("radiuslisten") ).optional = true
s1:option( Value, "radiusauthport", translate("radiusauthport") ).optional = true
s1:option( Value, "radiusacctport", translate("radiusacctport") ).optional = true

s1:option( Value, "radiusnasid", translate("radiusnasid") ).optional = true
s1:option( Value, "radiusnasip", translate("radiusnasip") ).optional = true

s1:option( Value, "radiuscalled", translate("radiuscalled") ).optional = true
s1:option( Value, "radiuslocationid", translate("radiuslocationid") ).optional = true
s1:option( Value, "radiuslocationname", translate("radiuslocationname") ).optional = true

--[[s1:option( Value, "radiusnasporttype", translate("radiusnasporttype") ).optional = true

s1:option( Flag, "radiusoriginalurl", translate("radiusoriginalurl") )
s1:option( Value, "adminuser", translate("adminuser") ).optional = true
rs = s1:option( Value, "adminpassword", translate("adminpassword") )
rs.optional = true
rs.password = true

s1:option( Flag, "swapoctets", translate("swapoctets") )
s1:option( Flag, "openidauth", translate("openidauth") )
s1:option( Flag, "wpaguests", translate("wpaguests") )
s1:option( Flag, "acctupdate", translate("acctupdate") )

s1:option( Value, "coaport", translate("coaport") ).optional = true
s1:option( Flag, "coanoipcheck", translate("coanoipcheck") )
]]

-- radius proxy
s2 = m:section(TypedSection, "proxy", '代理设置')
s2.anonymous = true

s2:option( Value, "proxylisten", translate("proxylisten") ).optional = true
s2:option( Value, "proxyport", translate("proxyport") ).optional = true
s2:option( Value, "proxyclient", translate("proxyclient") ).optional = true
ps = s2:option( Value, "proxysecret", translate("proxysecret") )
ps.optional = true
ps.password = true

return m
