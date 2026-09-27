# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Composable visualization for Bayesian workflows"
HOMEPAGE="https://github.com/arviz-devs/arviz-plots"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+matplotlib"

RDEPEND="
	>=dev-python/arviz-base-1.3[${PYTHON_USEDEP}]
	<dev-python/arviz-base-1.4[${PYTHON_USEDEP}]
	>=dev-python/arviz-stats-1.3[xarray,${PYTHON_USEDEP}]
	<dev-python/arviz-stats-1.4[${PYTHON_USEDEP}]
	matplotlib? ( >=dev-python/matplotlib-3.9[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
