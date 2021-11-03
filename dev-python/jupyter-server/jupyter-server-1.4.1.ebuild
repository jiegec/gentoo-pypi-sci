# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="The backend—i.e. core services, APIs, and REST endpoints—to Jupyter web applications."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/jupyter_server-${PV}.tar.gz"
HOMEPAGE="http://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/jupyter_server-${PV}"

IUSE="test"
RDEPEND="dev-python/jinja[${PYTHON_USEDEP}]
	>=www-servers/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-17[${PYTHON_USEDEP}]
	dev-python/ipython_genutils[${PYTHON_USEDEP}]
	>=dev-python/traitlets-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/jupyter_core-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter_client-6.1.1[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/nbconvert[${PYTHON_USEDEP}]
	dev-python/send2trash[${PYTHON_USEDEP}]
	>=dev-python/terminado-0.8.3[${PYTHON_USEDEP}]
	dev-python/prometheus_client[${PYTHON_USEDEP}]
	>=dev-python/anyio-2.0.2[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
