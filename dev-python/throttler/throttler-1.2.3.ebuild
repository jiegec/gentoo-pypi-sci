# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Zero-dependency Python package for throttling with asyncio support"
HOMEPAGE="https://github.com/uburuntu/throttler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

