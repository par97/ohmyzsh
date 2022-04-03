# ------------------------------------------------------------------------------
# Description
# -----------
# add "-o yaml | pygmentize -l yaml" to the end of line
# ------------------------------------------------------------------------------
# Authors
# -------
# jacklu
# this is written using the similar function in the sudo plugin 
# ------------------------------------------------------------------------------

yaml-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

    # Save beginning space
    local WHITESPACE=""
    if [[ ${LBUFFER:0:1} = " " ]]; then
        WHITESPACE=" "
        LBUFFER="${LBUFFER:1}"
    fi

    # Preserve beginning space
    LBUFFER="${WHITESPACE}${LBUFFER} -o yaml | pygmentize -l yaml"
}

zle -N yaml-command-line

# Defined shortcut keys: ctrl+\
bindkey -M emacs '\C-\' yaml-command-line
bindkey -M vicmd '\C-\' yaml-command-line
bindkey -M viins '\C-\' yaml-command-line
