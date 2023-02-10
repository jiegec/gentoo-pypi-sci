# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="XGBoost Python Package"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/dmlc/xgboost"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dask datatable pandas plotting scikit-learn"
RDEPEND="dev-python/numpy
	dev-python/scipy
	dask? ( dev-python/dask
		dev-python/pandas
		dev-python/distributed )
	datatable? ( dev-python/datatable )
	pandas? ( dev-python/pandas )
	plotting? ( dev-python/graphviz
		dev-python/matplotlib )
	scikit-learn? ( dev-python/scikit-learn )"
distutils_enable_tests pytest
