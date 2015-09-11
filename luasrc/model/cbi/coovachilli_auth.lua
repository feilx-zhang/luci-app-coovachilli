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

-- uam config
s1 = m:section(TypedSection, "uam", "UAM设置")
s1.anonymous = true

s1:option( Value, "uamserver", translate("uamserver"))
s1:option( Value, "uamsecret", translate("uamsecret")).password = true

--[[s1:option( Flag, "uamanydns", translate("uamanydns"))
s1:option( Flag, "nouamsuccess", translate("nouamsuccess"))
s1:option( Flag, "nouamwispr", translate("nouamwispr"))
s1:option( Flag, "chillixml", translate("chillixml"))
s1:option( Flag, "uamanyip", translate("uamanyip")).optional = true
s1:option( Flag, "dnsparanoia", translate("dnsparanoia")).optional = true
s1:option( Flag, "usestatusfile", translate("usestatusfile")).optional = true
]]

s1:option( Value, "uamhomepage", translate("uamhomepage")).optional = true
s1:option( Value, "uamlisten", translate("uamlisten")).optional = true
s1:option( Value, "uamport", translate("uamport")).optional = true

s1:option( DynamicList, "uamallowed", translate("uamallowed")).optional = true


-- mac authentication
s2 = m:section(TypedSection, "macauth", "MAC地址过滤")
s2.anonymous = true

s2:option( Flag, "macauth", translate("macauth"))
s2:option( Flag, "macallowlocal", translate("macallowlocal"))
s2:option( DynamicList, "macallowed", translate("macallowed"))

pw = s2:option( Value, "macpasswd", translate("macpasswd"))
pw.optional = true
pw.password = true

s2:option( Value, "macsuffix", translate("macsuffix")).optional = true

return m
