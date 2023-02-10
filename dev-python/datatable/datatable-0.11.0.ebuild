# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Python library for fast multi-threaded data manipulation and munging."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/h2oai/datatable"

LICENSE="Mozilla Public License v2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="tests optional"
RDEPEND="tests? ( >=dev-python/pytest-3.1
		>=dev-python/docutils-0.14 )
	optional? ( dev-python/numpy
		dev-python/pandas
		dev-python/xlrd )"
distutils_enable_tests pytest
