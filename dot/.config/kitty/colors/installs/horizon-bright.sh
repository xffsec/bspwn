#!/usr/bin/env bash

export PROFILE_NAME="Horizon Bright"

export COLOR_01="#16161C"           # Black (Host)
export COLOR_02="#DA103F"           # Red (Syntax string)
export COLOR_03="#1EB980"           # Green (Command)
export COLOR_04="#F6661E"           # Yellow (Command second)
export COLOR_05="#26BBD9"           # Blue (Path)
export COLOR_06="#EE64AE"           # Magenta (Syntax var)
export COLOR_07="#1D8991"           # Cyan (Prompt)
export COLOR_08="#FADAD1"           # White

export COLOR_09="#1A1C23"           # Bright Black
export COLOR_10="#F43E5C"           # Bright Red (Command error)
export COLOR_11="#07DA8C"           # Bright Green (Exec)
export COLOR_12="#F77D26"           # Bright Yellow
export COLOR_13="#3FC6DE"           # Bright Blue (Folder)
export COLOR_14="#F075B7"           # Bright Magenta
export COLOR_15="#1EAEAE"           # Bright Cyan
export COLOR_16="#FDF0ED"           # Bright White

export BACKGROUND_COLOR="#FDF0ED"   # Background
export FOREGROUND_COLOR="#1C1E26"   # Foreground (Text)

export CURSOR_COLOR="#1C1E26" # Cursor

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
