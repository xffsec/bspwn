#!/usr/bin/env bash

export PROFILE_NAME="Wild Cherry"

export COLOR_01="#000507"           # Black (Host)
export COLOR_02="#D94085"           # Red (Syntax string)
export COLOR_03="#2AB250"           # Green (Command)
export COLOR_04="#FFD16F"           # Yellow (Command second)
export COLOR_05="#883CDC"           # Blue (Path)
export COLOR_06="#ECECEC"           # Magenta (Syntax var)
export COLOR_07="#C1B8B7"           # Cyan (Prompt)
export COLOR_08="#FFF8DE"           # White

export COLOR_09="#009CC9"           # Bright Black
export COLOR_10="#DA6BAC"           # Bright Red (Command error)
export COLOR_11="#F4DCA5"           # Bright Green (Exec)
export COLOR_12="#EAC066"           # Bright Yellow
export COLOR_13="#308CBA"           # Bright Blue (Folder)
export COLOR_14="#AE636B"           # Bright Magenta
export COLOR_15="#FF919D"           # Bright Cyan
export COLOR_16="#E4838D"           # Bright White

export BACKGROUND_COLOR="#1F1726"   # Background
export FOREGROUND_COLOR="#DAFAFF"   # Foreground (Text)

export CURSOR_COLOR="#DAFAFF" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
