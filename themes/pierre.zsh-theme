autoload -U add-zsh-hook

if [ "$(whoami)" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="white"
fi


pierre_precmd() {
	local ret=$?
	local TERMWIDTH=$(( ${COLUMNS} - 5 ))
	local HBAR=─

	#left-pad nothing with for $TERMWIDTH chars, using $HBAR to fill on the right
	local FILLBAR="\${(l.(($TERMWIDTH))..${HBAR}.)}"

	echo -n "${fg_bold[black]}${(e)FILLBAR}"
	if [[ "a$ret" != "a0" ]]; then
		local ret_len=${#ret}
		#${(l)} can only use strings as padding parameters
		#this is why this expression is evaluated in two steps
		local tmp="\${(l:(( 3 - $ret_len ))::$HBAR:)}"
		echo "${(e)tmp} $fg[red]$ret$reset_color "
	else
		tmp="\${(l:5::$HBAR:)}"
		echo ${(e)tmp}
	fi

}
add-zsh-hook precmd pierre_precmd

PROMPT='\
%{${fg_bold[green]}%}%n%{$reset_color%}\
@\
%{${fg_bold[cyan]}%}%m%{$reset_color%}\
:%{$reset_color%}\
%{${fg_bold[blue]}%}%3~$(git_prompt_info)\
%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

#RPS1='$(vi_mode_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
