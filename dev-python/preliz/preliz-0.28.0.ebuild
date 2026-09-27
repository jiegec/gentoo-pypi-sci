# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Exploring and eliciting probability distributions"
HOMEPAGE="https://github.com/arviz-devs/preliz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/arviz-stats-1.0[${PYTHON_USEDEP}]
	<dev-python/arviz-stats-2[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.9[${PYTHON_USEDEP}]
	>=dev-python/numba-0.62[${PYTHON_USEDEP}]
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	>=dev-python/pytensor-distributions-0.3.2[${PYTHON_USEDEP}]
	<dev-python/pytensor-distributions-0.4[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.12[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
