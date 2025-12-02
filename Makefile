# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI usteer-ng app
LUCI_DEPENDS:=+luci-base +usteer-ng

PKG_LICENSE:=Apache-2.0
PKG_MAINTAINER:=Ramon Van Gorkom <Ramon00c00@gmail.com>

include $(TOPDIR)/feeds/luci/luci.mk
