# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Optimizing compiler for evaluating mathematical expressions on CPUs and GPUs."
HOMEPAGE="None"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="
dev-python/cython[${PYTHON_USEDEP}]
dev-python/scipy[${PYTHON_USEDEP}]
dev-python/numpy[${PYTHON_USEDEP}]
dev-python/numba[${PYTHON_USEDEP}]
dev-python/etuples[${PYTHON_USEDEP}]
dev-python/logical-unification[${PYTHON_USEDEP}]
dev-python/miniKanren[${PYTHON_USEDEP}]
dev-python/cons[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
