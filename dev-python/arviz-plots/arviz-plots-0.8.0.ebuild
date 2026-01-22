# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="ArviZ-plots provides ready to use and composable plots for Bayesian Workflow."
HOMEPAGE="None"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/arviz-base[${PYTHON_USEDEP}]
	dev-python/arviz-stats[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
