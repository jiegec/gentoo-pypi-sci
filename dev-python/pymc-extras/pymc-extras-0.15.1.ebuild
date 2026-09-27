# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Additional distributions, inference methods, and model transformations for PyMC"
HOMEPAGE="https://github.com/pymc-devs/pymc-extras"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}/${P}-jacobian.patch" )

RDEPEND="
	>=dev-python/arviz-1.2[${PYTHON_USEDEP}]
	<dev-python/arviz-2[${PYTHON_USEDEP}]
	>=dev-python/better-optimize-0.4.2[${PYTHON_USEDEP}]
	<dev-python/better-optimize-1[${PYTHON_USEDEP}]
	>=dev-python/preliz-0.27[${PYTHON_USEDEP}]
	<dev-python/preliz-0.29[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/pymc-6.3[${PYTHON_USEDEP}]
	<dev-python/pymc-6.4[${PYTHON_USEDEP}]
	>=dev-python/pytensor-3.3[${PYTHON_USEDEP}]
	<dev-python/pytensor-3.4[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/hatch-vcs[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
