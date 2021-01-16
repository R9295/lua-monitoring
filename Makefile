include $(TOPDIR)/rules.mk


PKG_NAME:=openwrt-netjson-monitoring
PKG_VERSION:=0.1 #$(shell cat ../VERSION)
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_SOURCE_SUBDIR)

 
include $(INCLUDE_DIR)/package.mk

define Package/openwrt-netjson-monitoring
  TITLE:= OpenWISP Monitoring 
	CATEGORY:=Administration
  SECTION:=admin
  SUBMENU:=openwisp
	DEPENDS: +lua +rpcd-mod-iwinfo +curl +lua-cjson
  TITLE:=Hello, World!
	VARIANT:=$(1)
	PKGARCH:=all
	MAINTAINER:=Federico Capoano <f.capoano@openwisp.io>
	URL:=http://openwisp.org
endef

define Package/openwrt-netjson-monitoring/install
	$(INSTALL_DIR) \
		$(1)/usr/sbin \
		$(1)/etc/crontabs \
		$(1)/etc/openwisp \
	
		$(INSTALL_BIN) \
			files/netjson-monitoring.lua \
			$(1)/usr/sbin/netjson-monitoring
		
		$(INSTALL_BIN) \
			files/netjson-monitoring-wan.lua \
			$(1)/usr/sbin/netjson-monitoring-wan
    			
		$(INSTALL_BIN) \
			files/openwisp-monitoring \
			$(1)/usr/sbin/openwisp-monitoring
			
		$(INSTALL_BIN) \
			files/monitoring-crontab \
			$(1)/etc/crontabs/root
    			

endef


$(eval $(call BuildPackage,openwrt-netjson-monitoring))