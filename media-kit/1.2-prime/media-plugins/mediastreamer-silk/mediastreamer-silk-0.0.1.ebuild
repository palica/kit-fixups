# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN="mssilk"
SDK_FILE="SILK_SDK_SRC_v1.0.8.zip" 

inherit autotools eutils

DESCRIPTION="SILK (skype codec) implementation for Linphone"
HOMEPAGE="http://www.linphone.org"
SRC_URI="mirror://nongnu/linphone/plugins/sources/${MY_PN}-${PV}.tar.gz
	https://github.com/gaozehua/SILKCodec/raw/master/${SDK_FILE}"

LICENSE="GPL-2+ Clear-BSD SILK-patent-license"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

RDEPEND=">=media-libs/mediastreamer-2.8.2:="
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_PN}"

RESTRICT="bindist" 

src_prepare() {
	epatch "${FILESDIR}/${P}-sdk.patch"
	eautoreconf
}