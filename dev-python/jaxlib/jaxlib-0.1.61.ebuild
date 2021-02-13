# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )

inherit python-r1

DESCRIPTION="XLA library for JAX"
SRC_URI="python_targets_python3_8? ( https://files.pythonhosted.org/packages/84/47/f51a4bf2dfbcf49ba67895e9456923b5d9bb20f1b508e2f8e59b07dbc66e/${PN}-${PV}-cp38-none-manylinux2010_x86_64.whl -> ${P}.zip )"
HOMEPAGE="https://github.com/google/jax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.12[${PYTHON_USEDEP}]
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/flatbuffers[${PYTHON_USEDEP}]"

S="${WORKDIR}"

src_install() {
	python_foreach_impl python_domodule ${PN}
}
