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
IUSE="+slurm conda reports"

# Upstream caps some Python dependencies; prefer current versions here and mask
# a version only after confirming a real incompatibility.
RDEPEND="
	conda? ( >=dev-python/conda-inject-1.3.1[${PYTHON_USEDEP}] )
	dev-python/configargparse[${PYTHON_USEDEP}]
	>=dev-python/connection_pool-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.20[${PYTHON_USEDEP}]
	>=dev-python/dpath-2.1.6[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]
	dev-python/immutables[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pulp-2.3.1[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/referencing[${PYTHON_USEDEP}]
	>=dev-python/requests-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/smart_open-4.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-common-1.20.1[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-executor-plugins-9.3.2[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-logger-plugins-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-report-plugins-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-scheduler-plugins-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-storage-plugins-4.4.1[${PYTHON_USEDEP}]
	>=dev-python/sqlmodel-0.0.37[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.1.4[${PYTHON_USEDEP}]
	dev-python/throttler[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	>=dev-python/yte-1.5.5[${PYTHON_USEDEP}]
	reports? ( dev-python/pygments[${PYTHON_USEDEP}] )
	slurm? ( >=dev-python/snakemake-executor-plugin-slurm-2.8.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

src_prepare() {
	# The only conda_inject import is inside the global Conda deployment path.
	if ! use conda; then
		grep -Fq '"conda-inject>=1.3.1,<2.0",' pyproject.toml || die
		sed -i '/"conda-inject>=1.3.1,<2.0",/d' pyproject.toml || die
	fi

	distutils-r1_src_prepare
}

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests/test_expand.py tests/test_io.py tests/test_schema.py
}
