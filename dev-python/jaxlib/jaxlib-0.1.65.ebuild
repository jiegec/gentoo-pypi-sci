# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 )

inherit python-r1

DESCRIPTION="XLA library for JAX"
SRC_URI="cuda? ( https://storage.googleapis.com/jax-releases/cuda112/${PN}-${PV}+cuda112-cp38-none-manylinux2010_x86_64.whl -> ${P}_cuda.zip )
	!cuda? ( https://files.pythonhosted.org/packages/b4/4a/3c1a1dc6dd01d45f53fb9afd59a909e1c744bfc7d359309efad12451c7a1/${PN}-${PV}-cp38-none-manylinux2010_x86_64.whl -> ${P}.zip )"
HOMEPAGE="https://github.com/google/jax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cuda"
RDEPEND="dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.12[${PYTHON_USEDEP}]
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/flatbuffers[${PYTHON_USEDEP}]
	cuda? (
		  >=dev-util/nvidia-cuda-toolkit-11
		  dev-libs/cudnn[cuda11]
	)"

S="${WORKDIR}"

src_install() {
	python_foreach_impl python_domodule ${PN}
}
