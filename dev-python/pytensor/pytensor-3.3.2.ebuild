# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Compiler for mathematical expressions and PyMC computational backend"
HOMEPAGE="https://github.com/pymc-devs/pytensor"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# The available Numba 0.65.1 requires NumPy <2.5.
RDEPEND="
	>=dev-python/setuptools-59[${PYTHON_USEDEP}]
	>=dev-python/scipy-1[${PYTHON_USEDEP}]
	<dev-python/scipy-2[${PYTHON_USEDEP}]
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	<dev-python/numpy-2.5[${PYTHON_USEDEP}]
	>=dev-python/numba-0.58[${PYTHON_USEDEP}]
	<=dev-python/numba-0.67.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.15[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	<dev-python/numpy-2.5[${PYTHON_USEDEP}]
	dev-python/versioneer[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
