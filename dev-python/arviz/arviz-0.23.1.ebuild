# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Exploratory analysis of Bayesian models"
HOMEPAGE="http://github.com/arviz-devs/arviz"
SRC_URI=https://github.com/arviz-devs/arviz/archive/refs/tags/v${PV}.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="
	dev-python/arviz-base[${PYTHON_USEDEP}]
	dev-python/arviz-stats[${PYTHON_USEDEP}]
	dev-python/arviz-plots[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
