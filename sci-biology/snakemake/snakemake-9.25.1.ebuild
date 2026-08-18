# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Workflow management system for reproducible and scalable data analyses"
HOMEPAGE="
	https://snakemake.github.io
	https://snakemake.readthedocs.io
	https://github.com/snakemake/snakemake
	https://pypi.org/project/snakemake/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="reports"

RDEPEND="
	dev-python/conda-inject[${PYTHON_USEDEP}]
	dev-python/configargparse[${PYTHON_USEDEP}]
	dev-python/connection_pool[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/dpath[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]
	dev-python/immutables[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pulp[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/referencing[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/smart_open[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-common[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-executor-plugins[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-logger-plugins[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-report-plugins[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-scheduler-plugins[${PYTHON_USEDEP}]
	dev-python/snakemake-interface-storage-plugins[${PYTHON_USEDEP}]
	dev-python/sqlmodel[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/throttler[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	dev-python/yte[${PYTHON_USEDEP}]
	reports? ( dev-python/pygments[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests/test_expand.py tests/test_io.py tests/test_schema.py
}

