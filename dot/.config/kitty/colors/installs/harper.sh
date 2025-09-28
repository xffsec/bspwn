#!/usr/bin/env bash

export PROFILE_NAME="Harper"

export COLOR_01="#010101"           # Black (Host)
export COLOR_02="#F8B63F"           # Red (Syntax string)
export COLOR_03="#7FB5E1"           # Green (Command)
export COLOR_04="#D6DA25"           # Yellow (Command second)
export COLOR_05="#489E48"           # Blue (Path)
export COLOR_06="#B296C6"           # Magenta (Syntax var)
export COLOR_07="#F5BFD7"           # Cyan (Prompt)
export COLOR_08="#A8A49D"           # White

export COLOR_09="#726E6A"           # Bright Black
export COLOR_10="#F8B63F"           # Bright Red (Command error)
export COLOR_11="#7FB5E1"           # Bright Green (Exec)
export COLOR_12="#D6DA25"           # Bright Yellow
export COLOR_13="#489E48"           # Bright Blue (Folder)
export COLOR_14="#B296C6"           # Bright Magenta
export COLOR_15="#F5BFD7"           # Bright Cyan
export COLOR_16="#FEFBEA"           # Bright White

export BACKGROUND_COLOR="#010101"   # Background
export FOREGROUND_COLOR="#A8A49D"   # Foreground (Text)

export CURSOR_COLOR="#A8A49D" # Cursor

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
