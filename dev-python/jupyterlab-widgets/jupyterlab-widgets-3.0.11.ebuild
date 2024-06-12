# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 pypi

DESCRIPTION="Jupyter interactive widgets for JupyterLab"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/jupyter-widgets/ipywidgets"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
