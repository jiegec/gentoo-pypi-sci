# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Snakemake executor plugin for submitting jobs to a Slurm cluster"
HOMEPAGE="
	https://snakemake.github.io/snakemake-plugin-catalog/plugins/executor/slurm.html
	https://github.com/snakemake/snakemake-executor-plugin-slurm
	https://pypi.org/project/snakemake-executor-plugin-slurm/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Keep dependency minimums from upstream and mask only proven incompatible updates.
RDEPEND="
	>=dev-python/numpy-2.4.5[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/snakemake-executor-plugin-slurm-jobstep-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-common-1.23.0[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-executor-plugins-9.4.0[${PYTHON_USEDEP}]
	>=dev-python/throttler-1.2.2[${PYTHON_USEDEP}]
"

# The cluster supplies sbatch, squeue and sacct outside Gentoo Prefix.

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests/test_time_conversion.py tests/test_parsing.py \
		tests/test_scontrol_parsing.py
}
