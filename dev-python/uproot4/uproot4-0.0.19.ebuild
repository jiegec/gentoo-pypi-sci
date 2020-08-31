# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="Development of uproot 4.0, to replace scikit-hep/uproot in 2020."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/uproot4"

LICENSE="BSD 3-clause"
SLOT="0"
KEYWORDS="~amd64"

