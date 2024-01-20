# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_11 )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Tweedie distribution estimations of pdf and cdf"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/thequackdaddy/tweedie"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
