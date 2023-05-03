# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )


DESCRIPTION="it has been replaced by jupyter-client::gentoo, keep it for IRkernel"
SRC_URI=""
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RDEPEND=">=dev-python/jupyter-client-${PV}"
