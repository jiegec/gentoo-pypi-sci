# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{9..12} )

inherit distutils-r1 pypi

DESCRIPTION="Matplotlib Jupyter Extension"
HOMEPAGE="http://matplotlib.org"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="BSD License"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

DEPEND="
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/ipython_genutils[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	dev-python/ipywidgets[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/jupyterlab-widgets[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	rm "${ED}"/usr/etc/ -rv || die
}

pkg_postinst() {
		ewarn "${P} works for jupyter-matplotlib-0.11.3"
		ewarn "Other jupter-matplotlib versions are not tested"
		ewarn "Fore more information, please visit https://matplotlib.org/ipympl/installing.html#compatibility-table"
}
