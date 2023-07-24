# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Utility to create and sign CAs and certificates"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/LLNL/certipy"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dev test"
RDEPEND="dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
