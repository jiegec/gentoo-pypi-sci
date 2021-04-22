# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Python code for Zernike polynomials"
SRC_URI="mirror://pypi/fd/a6/0cf0d11c004363c057c974c2bf0e686eb2436d5e6b0f74549693f35adc58/zernike-0.0.28.tar.gz"
HOMEPAGE="https://github.com/jacopoantonello/zernike"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
