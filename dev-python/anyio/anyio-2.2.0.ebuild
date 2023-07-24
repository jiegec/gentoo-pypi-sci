# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="High level compatibility layer for multiple asynchronous event loop implementations"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="curio doc test trio"
RDEPEND=">=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.1[${PYTHON_USEDEP}]
	dev-python/async_generator[${PYTHON_USEDEP}]
	dev-python/dataclasses[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.15[${PYTHON_USEDEP}]
	curio? ( >=dev-python/curio-1.4[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		>=dev-python/sphinx-autodoc-typehints-1.2.0[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.16[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
