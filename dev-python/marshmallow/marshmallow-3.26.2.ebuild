# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit-core
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Convert complex datatypes to and from native Python datatypes"
HOMEPAGE="https://github.com/marshmallow-code/marshmallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/packaging-17.0[${PYTHON_USEDEP}]"
BDEPEND="<dev-python/flit-core-4[${PYTHON_USEDEP}]"
