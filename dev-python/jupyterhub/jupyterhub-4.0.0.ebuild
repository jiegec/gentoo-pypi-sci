# Copyright 1999-2021 Gentoo Authors
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

RESTRICT="network-sandbox"
IUSE="test"
RDEPEND=">=dev-python/alembic-1.4[${PYTHON_USEDEP}]
	>=dev-python/async_generator-1.9[${PYTHON_USEDEP}]
	>=dev-python/certipy-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter_telemetry-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/prometheus_client-0.4.0[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]
	>=dev-python/tornado-5.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-4.3.2[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-3.6[${PYTHON_USEDEP}]
	dev-python/pamela[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.6.5[${PYTHON_USEDEP}]
	test? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		>=dev-python/jupyterlab-3[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nbclassic[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/selenium[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}] )"
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
