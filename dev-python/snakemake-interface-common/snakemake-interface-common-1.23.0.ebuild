# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Common functions and classes for Snakemake and its plugins"
HOMEPAGE="https://github.com/snakemake/snakemake-interface-common"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/argparse-dataclass[${PYTHON_USEDEP}]
	dev-python/configargparse[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"

