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

-- general
s = m:section(TypedSection, "general", "基本设置")
s.anonymous = true

--x = s:option( Flag, "debug", translate("开关"))


e = s:option(Button, "开关", "开关")

e.render = function(self, section, scope)

	if( 0 == os.execute("/bin/pidof chilli >/dev/null") ) then
		self.title = translate("关闭")
		--self.description = "save"
	else
		self.title = translate("开启")
		--self.description = "reset"
	end
	Button.render(self, section, scope)
end

e.write = function(self, section)
	if ( 0 == os.execute("/bin/pidof chilli >/dev/null") )then
		luci.sys.call("/etc/init.d/chilli stop >/dev/null" )
	else
		luci.sys.call("/etc/init.d/chilli start >/dev/null" )
	end
end



wanif = s:option( Value, "hs_wanif", translate("HS_WANIF"))
lanif = s:option( Value, "hs_lanif", translate("HS_LANIF"))
for _, nif in ipairs(luci.sys.net.devices()) do
	if nif ~= "lo" then 
	wanif:value(nif) 
	lanif:value(nif) 
	end
end

s:option( Value, "interval", translate("interval"))
s:option( Value, "pidfile" , translate("pidfile")).optional = true
--s:option( Value, "statedir", translate("statedir")).optional = true



return m
