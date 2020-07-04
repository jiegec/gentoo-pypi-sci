# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="XGBoost Python Package"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"
HOMEPAGE="https://xgboost.readthedocs.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
