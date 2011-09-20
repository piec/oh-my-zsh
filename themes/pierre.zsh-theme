if [ "$(whoami)" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="white"
fi

(( TERMWIDTH = ${COLUMNS} - 5 ))

#PR_HBAR=─
PR_HBAR=-
PR_FILLBAR="\${(l.(($TERMWIDTH))..${PR_HBAR}.)}"
PR_RETURN="%(?:----: %{$fg[red]%}%?%{$reset_color%})"

PROMPT='\
%{${fg_bold[black]}%}${(e)PR_FILLBAR}${PR_RETURN}
%{${fg_bold[green]}%}%n%{$reset_color%}\
@\
%{${fg_bold[cyan]}%}%m%{$reset_color%}\
:%{$reset_color%}\
%{${fg_bold[blue]}%}%3~$(git_prompt_info)\
%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

RPS1='$(vi_mode_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
