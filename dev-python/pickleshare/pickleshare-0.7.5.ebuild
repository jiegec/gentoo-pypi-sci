# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="Tiny 'shelve'-like database with concurrency support"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/pickleshare/pickleshare"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/pathlib2; python_version in "2.6 2.7 3.2 3.3""