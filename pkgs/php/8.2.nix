{ prev, mkPhp }:

let
  base = mkPhp {
    version = "8.2.0alpha3";
    sha256 = null;

    phpAttrsOverrides = attrs: {
      src = prev.fetchurl {
        url = "https://downloads.php.net/~sergey/php-8.2.0alpha3.tar.xz";
        sha256 = "iWB5nYgxn+22pLa+Fqn6CAaRFhabazSuxQ60GKQRoug=";
      };
    };
  };
in
base.withExtensions (
  { all, ... }:

  with all; (
    [
      bcmath
      calendar
      curl
      ctype
      dom
      exif
      fileinfo
      filter
      ftp
      gd
      gettext
      gmp
      iconv
      intl
      ldap
      mbstring
      mysqli
      mysqlnd
      opcache
      openssl
      pcntl
      pdo
      pdo_mysql
      pdo_odbc
      pdo_pgsql
      pdo_sqlite
      pgsql
      posix
      readline
      session
      simplexml
      sockets
      soap
      sodium
      sqlite3
      tokenizer
      xmlreader
      xmlwriter
      zip
      zlib
    ]
    ++ prev.lib.optionals (!prev.stdenv.isDarwin) [
      imap
    ]
  )
)
