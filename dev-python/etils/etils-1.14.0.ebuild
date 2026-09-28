# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit-core
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Collection of common Python utilities"
HOMEPAGE="https://github.com/google/etils"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+epath +epy"
REQUIRED_USE="epath? ( epy )"

RDEPEND="
	epath? (
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/zipp[${PYTHON_USEDEP}]
	)
	epy? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/flit-core-3.8[${PYTHON_USEDEP}]
	<dev-python/flit-core-4[${PYTHON_USEDEP}]
"
