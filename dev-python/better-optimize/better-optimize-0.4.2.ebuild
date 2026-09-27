# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Convenience improvements for SciPy optimization"
HOMEPAGE="https://github.com/jessegrabowski/better_optimize"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.15[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/threadpoolctl[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/versioneer[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
