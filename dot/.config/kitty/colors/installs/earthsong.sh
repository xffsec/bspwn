#!/usr/bin/env bash

export PROFILE_NAME="Earthsong"

export COLOR_01="#121418"           # Black (Host)
export COLOR_02="#C94234"           # Red (Syntax string)
export COLOR_03="#85C54C"           # Green (Command)
export COLOR_04="#F5AE2E"           # Yellow (Command second)
export COLOR_05="#1398B9"           # Blue (Path)
export COLOR_06="#D0633D"           # Magenta (Syntax var)
export COLOR_07="#509552"           # Cyan (Prompt)
export COLOR_08="#E5C6AA"           # White

export COLOR_09="#675F54"           # Bright Black
export COLOR_10="#FF645A"           # Bright Red (Command error)
export COLOR_11="#98E036"           # Bright Green (Exec)
export COLOR_12="#E0D561"           # Bright Yellow
export COLOR_13="#5FDAFF"           # Bright Blue (Folder)
export COLOR_14="#FF9269"           # Bright Magenta
export COLOR_15="#84F088"           # Bright Cyan
export COLOR_16="#F6F7EC"           # Bright White

export BACKGROUND_COLOR="#292520"   # Background
export FOREGROUND_COLOR="#E5C7A9"   # Foreground (Text)

export CURSOR_COLOR="#E5C7A9" # Cursor

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
