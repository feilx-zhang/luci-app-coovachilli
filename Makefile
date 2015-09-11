include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-coovachilli
PKG_VERSION=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-coovachilli
	SECTION:=luci
	CATEGORY:=LuCI	
	TITLE:=luci-app-coovachilli	
endef

define Package/luci-app-coovachilli/description
	This package contains LuCI configuration pages for coovachilli.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-coovachilli/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller

	$(INSTALL_CONF) ./root/etc/config/coovachilli $(1)/etc/config/coovachilli
	$(INSTALL_BIN) ./root/etc/init.d/chilli $(1)/etc/init.d/chilli
	$(INSTALL_BIN) ./root/etc/uci-defaults/luci-coovachilli $(1)/etc/uci-defaults/luci-coovachilli
	$(INSTALL_DATA) ./luasrc/model/cbi/coovachilli.lua $(1)/usr/lib/lua/luci/model/cbi/coovachilli.lua
	$(INSTALL_DATA) ./luasrc/model/cbi/coovachilli_auth.lua $(1)/usr/lib/lua/luci/model/cbi/coovachilli_auth.lua
	$(INSTALL_DATA) ./luasrc/model/cbi/coovachilli_network.lua $(1)/usr/lib/lua/luci/model/cbi/coovachilli_network.lua
	$(INSTALL_DATA) ./luasrc/model/cbi/coovachilli_radius.lua $(1)/usr/lib/lua/luci/model/cbi/coovachilli_radius.lua
	$(INSTALL_DATA) ./luasrc/controller/coovachilli.lua $(1)/usr/lib/lua/luci/controller/coovachilli.lua
endef

$(eval $(call BuildPackage,luci-app-coovachilli))