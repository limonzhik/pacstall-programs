pkgname="nodejs-deb"
gives="nodejs"
repology=("project: ${gives}")
arch=('amd64' 'arm64')
_major_version="24"
pkgver="24.1.0"
url='https://nodejs.org'
source_amd64=("https://deb.nodesource.com/node_${_major_version}.x/pool/main/n/nodejs/nodejs_${pkgver}-1nodesource1_amd64.deb")
source_arm64=("https://deb.nodesource.com/node_${_major_version}.x/pool/main/n/nodejs/nodejs_${pkgver}-1nodesource1_arm64.deb")
sha256sums_amd64=("4d970d1d72243db38db9431f625199c007f1d3a204ec649ad4b85f88f3916525")
sha256sums_arm64=("ac7c94306484f5cff01b93d3734e607fc455785141addf0a4934b0c4e2310e8f")
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-app")
replaces=("${gives}" "node")
pkgdesc="JavaScript runtime built on Chrome's V8 JavaScript engine"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')
