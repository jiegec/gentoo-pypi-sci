# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Statistical computation and diagnostics for ArviZ"
HOMEPAGE="https://github.com/arviz-devs/arviz-stats"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+xarray"

RDEPEND="
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.13[${PYTHON_USEDEP}]
	xarray? (
		>=dev-python/arviz-base-1.3[${PYTHON_USEDEP}]
		<dev-python/arviz-base-1.4[${PYTHON_USEDEP}]
		dev-python/xarray-einstats[${PYTHON_USEDEP}]
		>=dev-python/xarray-2024.11.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
