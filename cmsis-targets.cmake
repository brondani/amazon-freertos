### CMake targets ###

# Import global configurations.
include("tools/cmake/afr.cmake")

add_library(stm32l475_discovery_bsp_extensions)
target_sources(stm32l475_discovery_bsp_extensions PUBLIC
  "vendors/st/stm32l475_discovery/BSP/Components/es_wifi/es_wifi.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_api.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_api_calibration.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_api_core.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_api_ranging.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_api_strings.c"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/vl53l0x_platform_log.c"
)
target_include_directories(stm32l475_discovery_bsp_extensions PUBLIC
  "vendors/st/stm32l475_discovery/BSP/Components/es_wifi/"
  "vendors/st/stm32l475_discovery/BSP/Components/hts221/"
  "vendors/st/stm32l475_discovery/BSP/Components/lis3mdl/"
  "vendors/st/stm32l475_discovery/BSP/Components/lps22hb/"
  "vendors/st/stm32l475_discovery/BSP/Components/lsm6dsl/"
  "vendors/st/stm32l475_discovery/BSP/Components/mx25r6435f/"
  "vendors/st/stm32l475_discovery/BSP/Components/vl53l0x/"
)
set_target_properties(stm32l475_discovery_bsp_extensions PROPERTIES DEFINE_SYMBOL "")
set_target_properties(stm32l475_discovery_bsp_extensions PROPERTIES LINKER_LANGUAGE C)


add_library(stm32l475_discovery_common_io)
target_sources(stm32l475_discovery_common_io PUBLIC
  "vendors/st/boards/stm32l475_discovery/ports/common_io/iot_i2c.c"
  "vendors/st/boards/stm32l475_discovery/ports/common_io/iot_spi.c"
  "vendors/st/boards/stm32l475_discovery/ports/common_io/iot_uart.c"
)
set_target_properties(stm32l475_discovery_common_io PROPERTIES DEFINE_SYMBOL "")
set_target_properties(stm32l475_discovery_common_io PROPERTIES LINKER_LANGUAGE C)


add_library(stm32l475_discovery_secure_sockets)
target_sources(stm32l475_discovery_secure_sockets PUBLIC
  "vendors/st/boards/stm32l475_discovery/ports/pkcs11/core_pkcs11_pal.c"
  "vendors/st/boards/stm32l475_discovery/ports/secure_sockets/iot_secure_sockets.c"
)
set_target_properties(stm32l475_discovery_secure_sockets PROPERTIES DEFINE_SYMBOL "")
set_target_properties(stm32l475_discovery_secure_sockets PROPERTIES LINKER_LANGUAGE C)


add_library(stm32l475_discovery_wifi)
target_sources(stm32l475_discovery_wifi PUBLIC
  "vendors/st/boards/stm32l475_discovery/ports/wifi/iot_wifi.c"
)
set_target_properties(stm32l475_discovery_wifi PROPERTIES DEFINE_SYMBOL "")
set_target_properties(stm32l475_discovery_wifi PROPERTIES LINKER_LANGUAGE C)


if(EXISTS "${AFR_3RDPARTY_DIR}/mbedtls")
  afr_glob_src(mbedtls_library DIRECTORY "${AFR_3RDPARTY_DIR}/mbedtls/library" RECURSE)
  afr_glob_src(mbedtls_include DIRECTORY "${AFR_3RDPARTY_DIR}/mbedtls/include" RECURSE)

  add_library(mbedtls_lib)
  target_sources(mbedtls_lib PUBLIC ${mbedtls_library} ${mbedtls_include})
  set_target_properties(mbedtls_lib PROPERTIES DEFINE_SYMBOL "")
  set_target_properties(mbedtls_lib PROPERTIES LINKER_LANGUAGE C)
endif()
