include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-usteer-ng
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-usteer-ng
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI usteer-ng app
  DEPENDS:=+luci-base +usteer-ng
  PKGARCH:=all
endef

define Package/luci-app-usteer-ng/description
  LuCI support for usteer-ng.
endef

define Build/Compile
endef

define Package/luci-app-usteer-ng/install
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d

	# Copy htdocs
	$(CP) ./htdocs/* $(1)/www/

	# Copy root files (ACLs, Menu)
	$(CP) ./root/* $(1)/
endef

define Package/luci-app-usteer-ng/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	rm -f /tmp/luci-indexcache.*
	rm -rf /tmp/luci-modulecache/
	killall -HUP rpcd 2>/dev/null
	exit 0
}
endef

$(eval $(call BuildPackage,luci-app-usteer-ng))