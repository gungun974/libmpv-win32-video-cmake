set(flag
"CFLAGS='-UHAVE_READLINE' LIBREADLINE=''
CC=${TARGET_ARCH}-gcc
AR=${TARGET_ARCH}-ar
RANLIB=${TARGET_ARCH}-ranlib
prefix=${MINGW_INSTALL_PREFIX}
host=mingw")

ExternalProject_Add(mujs
    GIT_REPOSITORY https://github.com/ccxvii/mujs.git
    PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/mujs-*.patch
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE} ${flag}
    INSTALL_COMMAND ${MAKE} ${flag} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(mujs)
extra_step(mujs)
