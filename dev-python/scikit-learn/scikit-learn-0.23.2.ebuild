# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="A set of python modules for machine learning and data mining"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="http://scikit-learn.org"

LICENSE="new BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="alldeps"
RDEPEND=">=dev-python/numpy-1.13.3
	>=sci-libs/scipy-0.19.1
	>=dev-python/joblib-0.11
	>=dev-python/threadpoolctl-2.0.0
	alldeps? ( >=dev-python/numpy-1.13.3
		>=sci-libs/scipy-0.19.1 )"
distutils_enable_tests pytest
