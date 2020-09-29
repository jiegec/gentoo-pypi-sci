# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1

DESCRIPTION="IPython: Productive Interactive Computing"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://ipython.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="all doc kernel nbconvert nbformat notebook parallel qtconsole test"
RDEPEND=">=dev-python/setuptools-18.5
	>=dev-python/jedi-0.10
	dev-python/decorator
	dev-python/pickleshare
	>=dev-python/traitlets-4.2
	dev-python/prompt-toolkit (!=3.0.0,!=3.0.1,<3.1.0,>=2.0.0)
	dev-python/pygments
	dev-python/backcall
	dev-python/pexpect (>4.3); sys_platform != "win32"
	dev-python/appnope; sys_platform == "darwin"
	dev-python/colorama; sys_platform == "win32"
	all? ( >=dev-python/Sphinx-1.3
		dev-python/ipykernel
		dev-python/ipyparallel
		dev-python/ipywidgets
		dev-python/nbconvert
		dev-python/nbformat
		>=dev-python/nose-0.10.1
		dev-python/notebook
		>=dev-python/numpy-1.14
		dev-python/pygments
		dev-python/qtconsole
		dev-python/requests
		dev-python/testpath )
	doc? ( >=dev-python/Sphinx-1.3 )
	kernel? ( dev-python/ipykernel )
	nbconvert? ( dev-python/nbconvert )
	nbformat? ( dev-python/nbformat )
	notebook? ( dev-python/notebook
		dev-python/ipywidgets )
	parallel? ( dev-python/ipyparallel )
	qtconsole? ( dev-python/qtconsole )
	test? ( >=dev-python/nose-0.10.1
		dev-python/requests
		dev-python/testpath
		dev-python/pygments
		dev-python/nbformat
		dev-python/ipykernel
		>=dev-python/numpy-1.14 )"
distutils_enable_tests pytest
