# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 python3_1{0..3} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A Python package for optimal 1D k-means clustering"
SRC_URI="https://github.com/dstein64/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/dstein64/kmeans1d"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
