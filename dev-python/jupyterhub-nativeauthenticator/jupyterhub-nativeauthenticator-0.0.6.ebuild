# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="JupyterHub Native Authenticator"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/jupyterhub/nativeauthenticator"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/jupyterhub-0.8[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/onetimepass[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}"/${PN}-0.0.6_await.patch )

distutils_enable_tests pytest
