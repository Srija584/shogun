GetCompilers()

include(ExternalProject)
ExternalProject_Add(
	Eigen3
	PREFIX ${CMAKE_BINARY_DIR}/Eigen3
	DOWNLOAD_DIR ${THIRD_PARTY_DIR}/Eigen3
	URL http://ubuntu.osuosl.org/ubuntu/pool/universe/e/eigen3/eigen3_3.1.2.orig.tar.bz2
	URL_MD5 e9c081360dde5e7dcb8eba3c8430fde2
	CMAKE_ARGS -DEIGEN_INCLUDE_INSTALL_DIR:PATH=${THIRD_PARTY_DIR}/include/eigen
		-DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}${CMAKE_DEFINITIONS}
		-DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}${CMAKE_DEFINITIONS}
		-DCMAKE_C_COMPILER:STRING=${C_COMPILER}
		-DCMAKE_CXX_COMPILER:STRING=${CXX_COMPILER}
		-DEIGEN_BUILD_PKGCONFIG=0
	)

SET(EIGEN_INCLUDE_DIR ${THIRD_PARTY_DIR}/include/eigen)
LIST(APPEND SHOGUN_DEPENDS Eigen3)

UNSET(C_COMPILER)
UNSET(CXX_COMPILER)