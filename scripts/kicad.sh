# Based partly on https://dev-docs.kicad.org/en/build/windows-msys2/

pacman -S --needed \
    base-devel \
    git \
    ${MINGW_PACKAGE_PREFIX}-cmake \
    ${MINGW_PACKAGE_PREFIX}-doxygen \
    ${MINGW_PACKAGE_PREFIX}-python \
    ${MINGW_PACKAGE_PREFIX}-swig \
    ${MINGW_PACKAGE_PREFIX}-boost \
    ${MINGW_PACKAGE_PREFIX}-cairo \
    ${MINGW_PACKAGE_PREFIX}-glew \
    ${MINGW_PACKAGE_PREFIX}-curl \
    ${MINGW_PACKAGE_PREFIX}-wxwidgets3.2-msw \
    ${MINGW_PACKAGE_PREFIX}-cc \
    ${MINGW_PACKAGE_PREFIX}-glm \
    ${MINGW_PACKAGE_PREFIX}-opencascade \
    ${MINGW_PACKAGE_PREFIX}-ngspice \
    ${MINGW_PACKAGE_PREFIX}-zlib

# cd kicad-source
mkdir -p build-${MSYSTEM}/release && cd build-${MSYSTEM}/release && \
cmake -DCMAKE_BUILD_TYPE=Release \
      -G "MSYS Makefiles" \
      -DCMAKE_PREFIX_PATH="${MINGW_PREFIX}" \
      -DCMAKE_INSTALL_PREFIX="${MINGW_PREFIX}" \
      -DDEFAULT_INSTALL_PATH="${MINGW_PREFIX}" \
      -DOCC_INCLUDE_DIR="${MINGW_PREFIX}"/include/opencascade \
      -DKICAD_SCRIPTING_WXPYTHON=OFF \
      ../../

"${MINGW_PREFIX}"/bin/cmake.exe --build . --parallel 1 --verbose

"${MINGW_PREFIX}"/bin/cmake.exe --install . --parallel 1 --verbose
