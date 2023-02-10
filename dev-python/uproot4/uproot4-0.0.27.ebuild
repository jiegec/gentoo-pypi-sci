# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="ROOT I/O in pure Python and NumPy."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/uproot4"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/numpy
	dev-python/awkward1"

distutils_enable_tests pytest
