# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Hist classes and utilities"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/hist"

LICENSE="BSD 3-Clause License"
SLOT="0"
KEYWORDS="~amd64"

IUSE="all dev docs plot test"
RDEPEND=">=dev-python/numpy-1.13.3
	dev-python/boost-histogram (~=0.11.0)
	>=dev-python/histoprint-1.4
	dev-python/typing-extensions
	all? ( >=dev-python/Sphinx-3.0.0
		dev-python/ipykernel
		dev-python/ipython
		>=dev-python/matplotlib-3.0
		>=dev-python/mplhep-0.2.2
		dev-python/nbsphinx
		>=dev-python/pytest-4.6
		>=dev-python/recommonmark-0.5.0
		>=sci-libs/scipy-1.4
		dev-python/sphinx-copybutton
		>=dev-python/sphinx-rtd-theme-0.5.0
		>=dev-python/uncertainties-3 )
	dev? ( >=dev-python/pytest-4.6
		>=dev-python/matplotlib-3.0
		>=sci-libs/scipy-1.4
		>=dev-python/uncertainties-3
		>=dev-python/mplhep-0.2.2
		dev-python/ipykernel )
	docs? ( >=dev-python/matplotlib-3.0
		>=sci-libs/scipy-1.4
		>=dev-python/uncertainties-3
		>=dev-python/mplhep-0.2.2
		dev-python/nbsphinx
		>=dev-python/recommonmark-0.5.0
		>=dev-python/Sphinx-3.0.0
		dev-python/sphinx-copybutton
		>=dev-python/sphinx-rtd-theme-0.5.0
		dev-python/ipython )
	plot? ( >=dev-python/matplotlib-3.0
		>=sci-libs/scipy-1.4
		>=dev-python/uncertainties-3
		>=dev-python/mplhep-0.2.2 )
	test? ( >=dev-python/pytest-4.6 )"
distutils_enable_tests pytest
