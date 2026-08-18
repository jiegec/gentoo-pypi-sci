# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Pyro PPL on NumPy"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/pyro-ppl/numpyro"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="examples"
RDEPEND="
	>=dev-python/jax-0.4.14[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.4.14[${PYTHON_USEDEP}]
	dev-python/multipledispatch[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	examples? (
		dev-python/arviz[${PYTHON_USEDEP}]
		dev-python/graphviz[${PYTHON_USEDEP}]
		dev-python/jupyter[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/wordcloud[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

