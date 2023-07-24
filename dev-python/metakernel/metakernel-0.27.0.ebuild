# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Metakernel for Jupyter"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/Calysto/metakernel"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="activity parallel test"
RDEPEND="dev-python/ipykernel
	>=dev-python/pexpect-4.2
	activity? ( dev-python/portalocker )
	parallel? ( dev-python/ipyparallel )
	test? ( dev-python/pytest
		dev-python/pytest-cov
		dev-python/requests )"
distutils_enable_tests pytest
