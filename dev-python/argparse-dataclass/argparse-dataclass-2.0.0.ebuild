# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Declarative CLIs with argparse and dataclasses"
HOMEPAGE="https://github.com/mivade/argparse_dataclass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

