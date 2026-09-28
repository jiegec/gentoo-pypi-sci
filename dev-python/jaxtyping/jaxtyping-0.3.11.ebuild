# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Type annotations for array shapes and dtypes"
HOMEPAGE="https://github.com/patrick-kidger/jaxtyping"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/wadler-lindig-0.1.3[${PYTHON_USEDEP}]"
