pkgname="librewolf-app"
gives="librewolf"
pkgver="139.0.4-1"
pkgdesc="A fork of Firefox, focused on privacy, security and freedom."
arch=('amd64' 'arm64')
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
breaks=("${gives}-deb" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")
sha256sums_amd64=(
  "cfa84f23849adc20fcdec46137913cef00bd8b1fa53c7bb1dfc8d5421ceefbeb"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "804d13694441f8ef5a7e18a953557184226748e0be7db3bd595295e7ff9386d0"
  "SKIP"
  "SKIP"
)
source_amd64=(
  "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.x86_64.AppImage"
  "icon.png::https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
source_arm64=(
  "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.aarch64.AppImage"
  "icon.png::https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)

package() {
  if [[ ${CARCH} == amd64 ]]; then
    gnuarch="x86_64"
  else
    gnuarch="aarch64"
  fi

  cd "${srcdir}"
  # Install appimage
  install -Dm755 "LibreWolf.${gnuarch}.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Download icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}

post_remove() {
  # Delete ~/.librewolf if it exists
  if [[ -d "${homedir}/.librewolf" ]]; then
    if ask "Do you want to delete ~/.librewolf/ files?" Y; then
      rm -rf "${homedir}/.librewolf"
    fi
  fi
}
