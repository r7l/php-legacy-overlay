# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PHP_EXT_NAME="oauth"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php7-4 php8-0 php8-1 php8-2"

inherit php-ext-pecl-r3

KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DESCRIPTION="OAuth is an authorization protocol built on top of HTTP"
LICENSE="BSD"
SLOT="legacy"
IUSE="+curl examples"

DEPEND="
	dev-libs/libpcre:3=
	curl? ( net-misc/curl:0= )
"
RDEPEND="${DEPEND}
	php_targets_php7-4? ( !dev-php/pecl-oauth:0[php_targets_php7-4] )
	php_targets_php8-0? ( !dev-php/pecl-oauth:0[php_targets_php8-0] )
	php_targets_php8-1? ( !dev-php/pecl-oauth:0[php_targets_php8-1] )
	php_targets_php8-2? ( !dev-php/pecl-oauth:0[php_targets_php8-2] )"

src_configure() {
	local PHP_EXT_ECONF_ARGS=(
		--enable-oauth
		$(use_with curl)
	)
	php-ext-source-r3_src_configure
}
