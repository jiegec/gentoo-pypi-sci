# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="A Python library for probabilistic modeling and inference"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="http://pyro.ai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="$(python_gen_cond_dep '
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	>=dev-python/opt-einsum-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/pyro-api-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.36[${PYTHON_USEDEP}]
	')
	>=sci-libs/pytorch-1.9.0[${PYTHON_SINGLE_USEDEP}]"
distutils_enable_tests pytest
