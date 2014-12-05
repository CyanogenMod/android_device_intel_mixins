BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.vblankoffdelay=1 i915.fastboot=1
USE_OPENGL_RENDERER := true
USE_INTEL_UFO_DRIVER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Allow HWC to perform a final CSC on virtual displays
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

ADDITIONAL_DEFAULT_PROPERTIES += \
	persist.intel.ogl.username=Developer \
	persist.intel.ogl.debug=/data/ufo.prop \
	persist.intel.ogl.dumpdebugvars=1 \
	ro.ufo.use_coreu=1

