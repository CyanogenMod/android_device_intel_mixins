# Set USE_CAMERA_STUB to 'true' for Fake Camera builds (emulator).
USE_CAMERA_STUB := false

# Select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true

# The new camera V3 HAL is work in progress. Do not enable yet.
USE_CAMERA_HAL_3 := false

# Intel Test Camera depends on Intel camera extension, so we have to set to false for now.
INTEL_TEST_CAMERA := false

# Intel camera extras (HDR, face detection, panorama, red-eye detection etc.).
USE_INTEL_CAMERA_EXTRAS := true

# Do not use shared object of ia_face by default
USE_SHARED_IA_FACE := false

# Use panorama v1.0 by default
IA_PANORAMA_VERSION := 1.0

# Set CSS API version. Should be detected in run-time instead, based on HW capability.
USE_CSS_2_1 := true

# Enable IPP optimized JPEG (backend to libjpeg).
USE_INTEL_IPP := true

# Disable JPEG HW encoder. Should be detected in run-time instead, based on HW capability.
USE_INTEL_JPEG := false

# Use Intel meta buffer type to share buffer with video encoder. 
USE_INTEL_METABUFFER := true

# FIXME: remove below flag when usage has been removed.
# FIXME2: note that the ufo mixin also sets this, arbitrate...
BOARD_GRAPHIC_IS_GEN := true
