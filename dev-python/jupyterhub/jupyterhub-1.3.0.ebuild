# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 prefix

DESCRIPTION="JupyterHub: A multi-user server for Jupyter notebooks"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/alembic[${PYTHON_USEDEP}]
	>=dev-python/async_generator-1.9[${PYTHON_USEDEP}]
	>=dev-python/certipy-0.1.2[${PYTHON_USEDEP}]
	dev-python/entrypoints[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter_telemetry-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus_client-0.4.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.1[${PYTHON_USEDEP}]
	>=www-servers/tornado-5.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-4.3.2[${PYTHON_USEDEP}]
	dev-python/pamela[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.6.5[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install

	diropts -m0700
	insinto /etc/jupyterhub

	dodir /etc/jupyterhub
	keepdir /var/lib/jupyterhub

	newins "$(prefixify_ro "${FILESDIR}"/pseudo.py)" config.py
	newins "$(prefixify_ro "${FILESDIR}"/pseudo_singleuser.py)" singleuser.py
	newinitd "$(prefixify_ro "${FILESDIR}"/${PN}.initd)" ${PN}
}

pkg_postinst() {
	elog "Jupyterhub also depends on Node.js package 'configurable-http-proxy'"
	elog "Please execute 'npm install -g configurable-http-proxy' to install it yourself."
}
