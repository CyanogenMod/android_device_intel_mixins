$(call inherit-product-if-exists, vendor/google/gms/products/gms.mk)
$(call inherit-product-if-exists, vendor/google/gms/products/gms_optional.mk)

PRODUCT_PROPERTY_OVERRIDES += \
 ro.com.google.clientidbase=android-intel
