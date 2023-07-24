# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Differentiate, compile, and transform Numpy code."
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/google/jax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
