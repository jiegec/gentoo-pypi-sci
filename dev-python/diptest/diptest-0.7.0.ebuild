# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Hartigan's diptest."
HOMEPAGE=""

LICENSE="GPLv2+"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
