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

require("luci.sys")
require("luci.ip")

m = Map("coovachilli")

-- tun
s1 = m:section(TypedSection, "tun", '网络设置')
s1.anonymous = true

--s1:option( Flag, "usetap" )
--s1:option( Value, "tundev" ).optional = true
--s1:option( Value, "txqlen" ).optional = true

net = s1:option( Value, "net", translate("net"))
for _, route in ipairs(luci.sys.net.routes()) do
	if route.device ~= "lo" and route.dest:prefix() < 32 then
		net:value( route.dest:string() )
	end
end

s1:option( Value, "dynip", translate("dynip")).optional = true
s1:option( Value, "statip", translate("statip")).optional = true

s1:option( Value, "dns1", translate("dns1")).optional = true
s1:option( Value, "dns2", translate("dns2")).optional = true
s1:option( Value, "domain", translate("domain")).optional = true

s1:option( Value, "ipup", translate("ipup")).optional = true
s1:option( Value, "ipdown", translate("ipdown")).optional = true

s1:option( Value, "conup", translate("conup")).optional = true
s1:option( Value, "condown", translate("condown")).optional = true


-- dhcp config
s2 = m:section(TypedSection, "dhcp", 'DHCP设置')
s2.anonymous = true

dif = s2:option( Value, "dhcpif", translate("dhcpif"))
for _, nif in ipairs(luci.sys.net.devices()) do
	if nif ~= "lo" then dif:value(nif) end
end

s2:option( Value, "dhcpmac", translate("dhcpmac")).optional = true
s2:option( Value, "lease", translate("lease")).optional = true
--s2:option( Value, "dhcpstart", translate("dhcpstart")).optional = true
--s2:option( Value, "dhcpend", translate("dhcpend")).optional = true

--s2:option( Flag, "eapolenable", translate("eapolenable"))


return m
