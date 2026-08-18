# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Logger plugin interface for Snakemake"
HOMEPAGE="https://github.com/snakemake/snakemake-interface-logger-plugins"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/snakemake-interface-common[${PYTHON_USEDEP}]
"

