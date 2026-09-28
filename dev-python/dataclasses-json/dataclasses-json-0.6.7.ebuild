# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Serialize dataclasses to and from JSON"
HOMEPAGE="https://github.com/lidatong/dataclasses-json"
SRC_URI="$(pypi_wheel_url "${PN}" "${PV}")"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.4.0[${PYTHON_USEDEP}]
	<dev-python/typing-inspect-1[${PYTHON_USEDEP}]
"

python_compile() {
	local wheel="$(pypi_wheel_name "${PN}" "${PV}")"
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${wheel}"
}
