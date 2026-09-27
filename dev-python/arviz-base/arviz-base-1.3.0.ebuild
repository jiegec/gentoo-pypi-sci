# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Base data structures and converters for ArviZ"
HOMEPAGE="https://github.com/arviz-devs/arviz-base"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	>=dev-python/xarray-2024.11.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10[${PYTHON_USEDEP}]
	>=dev-python/lazy-loader-0.4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
