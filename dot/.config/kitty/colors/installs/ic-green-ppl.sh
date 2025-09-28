#!/usr/bin/env bash

export PROFILE_NAME="Ic Green Ppl"

export COLOR_01="#1F1F1F"           # Black (Host)
export COLOR_02="#FB002A"           # Red (Syntax string)
export COLOR_03="#339C24"           # Green (Command)
export COLOR_04="#659B25"           # Yellow (Command second)
export COLOR_05="#149B45"           # Blue (Path)
export COLOR_06="#53B82C"           # Magenta (Syntax var)
export COLOR_07="#2CB868"           # Cyan (Prompt)
export COLOR_08="#E0FFEF"           # White

export COLOR_09="#032710"           # Bright Black
export COLOR_10="#A7FF3F"           # Bright Red (Command error)
export COLOR_11="#9FFF6D"           # Bright Green (Exec)
export COLOR_12="#D2FF6D"           # Bright Yellow
export COLOR_13="#72FFB5"           # Bright Blue (Folder)
export COLOR_14="#50FF3E"           # Bright Magenta
export COLOR_15="#22FF71"           # Bright Cyan
export COLOR_16="#DAEFD0"           # Bright White

export BACKGROUND_COLOR="#3A3D3F"   # Background
export FOREGROUND_COLOR="#D9EFD3"   # Foreground (Text)

export CURSOR_COLOR="#D9EFD3" # Cursor

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
