# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="Python library for fast multi-threaded data manipulation and munging."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/h2oai/datatable"

LICENSE="Mozilla Public License v2.0"
SLOT="0"
KEYWORDS="amd64"

IUSE="testing"
RDEPEND="dev-python/blessed
	>=dev-python/typesentry-0.2.6
	testing? ( >=dev-python/docutils-0.14
		>=dev-python/pytest-3.1
		>=dev-python/pytest-benchmark-3.1
		dev-python/pytest-cov )"