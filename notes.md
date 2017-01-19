# Setting up new mac

* Install latest updates from App store
* Open terminal.app and run `xcode-select --install`
* Install [homebrew](http://brew.sh/)
* Install python via homebrew and link it as app. See below
* Install macvim via homebrew and setup with config files from this repo
* Install [iterm](https://iterm2.com) and do following to setup keys:
    * goto preference -> profiles -> keys and replace option + left with "send escape sequence" followed by b. 
    Similarly, option + right with "send escape sequence" followed by f. 
    * Under profiles -> keys change "Left option key acts as" to +Esc. Similarly for right also
* Setup bash conf from this repo

## Installing python

https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md
During installation of openssl it suggests to do following:
```
A CA file has been bootstrapped using certificates from the system
keychain. To add additional certificates, place .pem files in
  /usr/local/etc/openssl/certs

and run
  /usr/local/opt/openssl/bin/c_rehash

This formula is keg-only, which means it was not symlinked into /usr/local.

Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

    LDFLAGS:  -L/usr/local/opt/openssl/lib
    CPPFLAGS: -I/usr/local/opt/openssl/include
```
