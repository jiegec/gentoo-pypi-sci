# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="JupyterHub: A multi-user server for Jupyter notebooks"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/alembic
	>=dev-python/async_generator-1.9
	>=dev-python/certipy-0.1.2
	dev-python/entrypoints
	>=dev-python/jinja-2.11.0
	>=dev-python/jupyter_telemetry-0.1.0
	>=dev-python/oauthlib-3.0
	>=dev-python/prometheus_client-0.4.0
	dev-python/python-dateutil
	dev-python/requests
	>=dev-python/sqlalchemy-1.1
	>=www-servers/tornado-5.1
	>=dev-python/traitlets-4.3.2
	dev-python/pamela
	>=dev-python/psutil-5.6.5"
distutils_enable_tests pytest
