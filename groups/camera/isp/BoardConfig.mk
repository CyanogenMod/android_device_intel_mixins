INTEL_CAMERA := true
INTEL_TEST_CAMERA := false

# Use Intel camera extras (HDR, face detection, panorama, etc.) by default
USE_INTEL_CAMERA_EXTRAS := true

# Camera
# Set USE_CAMERA_STUB to 'true' for Fake Camera builds,
# 'false' for libcamera builds to use Camera Imaging(CI) supported by intel.
USE_CAMERA_STUB := false

# select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true

# disable the new V3 HAL by default so it can be added to the tree without conflicts
# it will be enabled in selected platforms
USE_CAMERA_HAL_3 := false

# Set USE_VIDEO_EFFECT to 'false' to unsupport live face effect. And Set OMX Component Input Buffer Count to 2.
USE_VIDEO_EFFECT := true

# Do not use shared object of ia_face by default
USE_SHARED_IA_FACE := false

# Use panorama v1.0 by default
IA_PANORAMA_VERSION := 1.0

USE_CSS_2_1 := true
USE_INTEL_IPP := true
