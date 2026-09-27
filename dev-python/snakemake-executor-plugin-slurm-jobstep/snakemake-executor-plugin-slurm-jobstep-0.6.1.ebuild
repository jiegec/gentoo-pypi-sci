# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Snakemake executor plugin for running srun jobs inside Slurm jobs"
HOMEPAGE="
	https://snakemake.github.io/snakemake-plugin-catalog/plugins/executor/slurm-jobstep.html
	https://github.com/snakemake/snakemake-executor-plugin-slurm-jobstep
	https://pypi.org/project/snakemake-executor-plugin-slurm-jobstep/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/snakemake-interface-common-1.17.4[${PYTHON_USEDEP}]
	>=dev-python/snakemake-interface-executor-plugins-9.3.2[${PYTHON_USEDEP}]
"

# Compute nodes supply srun outside Gentoo Prefix.
