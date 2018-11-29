#setopt noglobalrcs

function () {

fhsroots=(
	~/local
	~/.local
)

setopt localoptions allexport nullglob

EDITOR=vim
VISUAL=$EDITOR

PAGER=less
LESS=-RSix4j3

MERGE=vimdiff

typeset -gU path
path=(
	~/bin
	$^fhsroots/bin
	~/.cargo/bin
	~/go/bin
	$path)

typeset -gU manpath
manpath=($^fhsroots/man $manpath '')

typeset -gTU LD_LIBRARY_PATH ld_library_path
ld_library_path=($^fhsroots/lib $ld_library_path)

typeset -gTU CPATH cpath
cpath=($^fhsroots/include $cpath '')

typeset -gTU PKG_CONFIG_PATH pkg_config_path
pkg_config_path=($^fhsroots/{lib,share}/pkgconfig $pkg_config_path)

typeset -gTU XDG_DATA_DIRS xdg_data_dirs
xdg_data_dirs=($^fhsroots/share $xdg_data_dirs /usr/{,local/}share)

typeset -gTU PERL5LIB perl5lib
typeset -gTU RUBYLIB rubylib
typeset -gTU PYTHONPATH pythonpath
typeset -gTU GOPATH gopath

WINEARCH=win64

DOTNET_CLI_TELEMETRY_OPTOUT=1
DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

if [[ -n $DISPLAY ]]
then
	BROWSER=/usr/bin/firefox
fi

source ~/.zcommands

}
