# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_1{1..3} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit distutils-r1 pypi

DESCRIPTION="DuckDB embedded database"
HOMEPAGE="https://www.duckdb.org"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")
test? (
	https://github.com/duckdb/duckdb-data/releases/download/v1.0/G1_1e7_1e2_5_0.csv.gz
	https://github.com/duckdb/duckdb-data/releases/download/v1.0/J1_1e7_NA_0_0.csv.gz
	https://github.com/duckdb/duckdb-data/releases/download/v1.0/J1_1e7_1e1_0_0.csv.gz
	https://github.com/duckdb/duckdb-data/releases/download/v1.0/J1_1e7_1e4_0_0.csv.gz
	https://github.com/duckdb/duckdb-data/releases/download/v1.0/J1_1e7_1e7_0_0.csv.gz
)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pybind11[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pyarrow[${PYTHON_USEDEP}]
	test? ( dev-python/mypy )
"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${PN}-1.2.0-do-not-download-test-data.patch" )

distutils_enable_tests pytest

src_unpack () {
	for dist in ${A}; do
		if [[ ${dist} == ${P}* ]]; then
			unpack ${dist}
		else
			cp -v "${DISTDIR}/${dist}" "${S}"/
		fi
	done
}

python_test() {
	einfo $(pwd)
	rm -rf duckdb || die
	epytest
}
