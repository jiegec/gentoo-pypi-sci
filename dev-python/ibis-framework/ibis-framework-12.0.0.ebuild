# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 python3_14 )

inherit distutils-r1 pypi

DESCRIPTION="The portable Python dataframe library"
HOMEPAGE="https://ibis-project.org"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/atpublic-2.3[${PYTHON_USEDEP}]
	>=dev-python/parsy-2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	dev-python/sqlglot[${PYTHON_USEDEP}]
	>=dev-python/toolz-0.11[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.7[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

PATCHES=( "${FILESDIR}"/${PN}-12_no-arrow-hotfix.patch )
