# The easiest way to install vimcom is to use the devtools package.
devtools::install_github("jalvesaq/VimCom")

# To manually download and install VimCom, do the following in a terminal emulator:
git clone https://github.com/jalvesaq/VimCom.git

# And, then, do in R:
install.packages("path/to/VimCom", type = "source", repos = NULL)

# To enable the support for Vim's 'clientserver' based on the X Server on Mac OS X, do the following:
install.packages("path/to/VimCom", type = "source", repos = NULL,
                  configure.args = "--enable-clientserver")

