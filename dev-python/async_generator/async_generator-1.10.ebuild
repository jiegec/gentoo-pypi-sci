# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Async generators and context managers for Python 3.5+"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/python-trio/async_generator"

LICENSE="MIT -or- Apache License 2.0"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
