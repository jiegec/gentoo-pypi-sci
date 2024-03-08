# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Module for generating and validating HOTP and TOTP tokens"
HOMEPAGE="https://github.com/tadeck/onetimepass/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
