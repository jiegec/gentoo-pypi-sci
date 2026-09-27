# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Probabilistic programming and Bayesian modeling with PyTensor"
HOMEPAGE="https://www.pymc.io/ https://github.com/pymc-devs/pymc"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/arviz-1.1[${PYTHON_USEDEP}]
	<dev-python/arviz-2[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.2.1[${PYTHON_USEDEP}]
	<dev-python/cachetools-7[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.24[${PYTHON_USEDEP}]
	>=dev-python/pytensor-3.2.2[${PYTHON_USEDEP}]
	<dev-python/pytensor-3.4[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/threadpoolctl-3.1[${PYTHON_USEDEP}]
	<dev-python/threadpoolctl-4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/versioneer[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
