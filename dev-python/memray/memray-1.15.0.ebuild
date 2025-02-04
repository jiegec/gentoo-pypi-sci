# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A memory profiler for Python applications"
HOMEPAGE="https://github.com/bloomberg/memray"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/textual[${PYTHON_USEDEP}]
	dev-libs/elfutils
	sys-libs/libunwind
	app-arch/lz4
"
