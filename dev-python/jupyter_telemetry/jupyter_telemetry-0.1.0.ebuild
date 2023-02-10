# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Jupyter telemetry library"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="http://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/python-json-logger[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
