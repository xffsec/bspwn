#!/usr/bin/env bash

export PROFILE_NAME="Everblush"

export COLOR_01="#232A2D"           # Black (Host)
export COLOR_02="#E57474"           # Red (Syntax string)
export COLOR_03="#8CCF7E"           # Green (Command)
export COLOR_04="#E5C76B"           # Yellow (Command second)
export COLOR_05="#67B0E8"           # Blue (Path)
export COLOR_06="#C47FD5"           # Magenta (Syntax var)
export COLOR_07="#6CBFBF"           # Cyan (Prompt)
export COLOR_08="#B3B9B8"           # White

export COLOR_09="#2D3437"           # Bright Black
export COLOR_10="#EF7E7E"           # Bright Red (Command error)
export COLOR_11="#96D988"           # Bright Green (Exec)
export COLOR_12="#F4D67A"           # Bright Yellow
export COLOR_13="#71BAF2"           # Bright Blue (Folder)
export COLOR_14="#CE89DF"           # Bright Magenta
export COLOR_15="#67CBE7"           # Bright Cyan
export COLOR_16="#BDC3C2"           # Bright White

export BACKGROUND_COLOR="#141B1E"   # Background
export FOREGROUND_COLOR="#DADADA"   # Foreground (Text)

export CURSOR_COLOR="#DADADA" # Cursor

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
