# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="ROOT I/O in pure Python and NumPy."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/uproot4"

LICENSE="BSD 3-clause"
SLOT="0"
KEYWORDS="~amd64"

IUSE="testing"
RDEPEND="dev-python/numpy
	testing? ( dev-python/pytest
		dev-python/flake8
		dev-python/scikit-hep-testdata
		dev-python/lz4
		dev-python/xxhash
		dev-python/pandas
		dev-python/awkward1
		dev-python/boost-histogram
		>=dev-python/hist-2.0.0a1 )"
distutils_enable_tests pytest
