# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="TUI application for navigating and viewing HDF5 files"
HOMEPAGE="None"

LICENSE="MIT License"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/textual[${PYTHON_USEDEP}]
	dev-python/textual-plotext[${PYTHON_USEDEP}]
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
