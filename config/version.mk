#Version of the ROM
CARBON_CODENAME := PAX
CARBON_REVISION := CR-8.0

ifndef CARBON_BUILDTYPE
  CARBON_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst carbon_,,$(TARGET_PRODUCT_SHORT))

# Chocolate
ifeq ($(GAPPS),true)
$(GAPPS will be included in the build)
CARBON_GAPPS := CHOCOLATE
ifeq ($(GAPPS_ARM64),)
$(warning GAPPS_ARM64 is not set, it defaulting to 64bit)
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif
ifeq ($(GAPPS_ARM64), false)
$(warning arm64 support is unavailable, setting GAPPS_ARM64 to false)
$(call inherit-product, vendor/gapps/arm/arm-vendor.mk)
endif
else
CARBON_GAPPS := VANILLA
endif

CARBON_VERSION := $(CARBON_REVISION)-$(CARBON_CODENAME)-$(CARBON_GAPPS)-$(CARBON_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(shell date -u +%Y%m%d-%H%M)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID="$(BUILD_ID)-$(BUILD_USERNAME)@$(BUILD_HOSTNAME)"
