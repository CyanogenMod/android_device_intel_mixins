PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

$(call inherit-product-if-exists, vendor/google/gms/products/gms_gpe.mk)

PRODUCT_PROPERTY_OVERRIDES += \
 ro.com.google.clientidbase=android-intel
