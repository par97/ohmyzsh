# ------------------------------------------------------------------------------
# Description
# -----------
# insert "wcat" to the beginning of line
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
    LBUFFER="wcat ${WHITESPACE}${LBUFFER}"
}

zle -N yaml-command-line

# Defined shortcut keys: ctrl+\
bindkey -M emacs '``' yaml-command-line
bindkey -M vicmd '``' yaml-command-line
bindkey -M viins '``' yaml-command-line
