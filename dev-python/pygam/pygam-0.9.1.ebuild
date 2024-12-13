# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/numpy-1.25[${PYTHON_USEDEP}]
	>=dev-python/progressbar2-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.11.1[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

PATCHES=( "${FILESDIR}/${PN}-0.9.1-disable-peotry-dynamic-versioning.patch" )
