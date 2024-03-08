# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="PyTorch Image Models"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/huggingface/pytorch-image-models"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="sci-libs/pytorch[${PYTHON_USEDEP}]
	dev-python/torchvision[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/safetensors[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
