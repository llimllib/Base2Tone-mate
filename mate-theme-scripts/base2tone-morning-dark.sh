#!/usr/bin/env bash
# Base2Tone-Morning - Mate Terminal color scheme install script
# by Bram de Haan, adapted from DuoTone themes by Simurai (http://simurai.com/projects/2016/01/01/duotone-themes)
# generated by https://github.com/base16-builder/base16-builder

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Base2Tone-Morning Dark"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-base-2-tone-morning-dark"
[[ -z "$DCONFTOOL" ]] && DCONFTOOL=dconf
[[ -z "$BASE_KEY" ]] && BASE_KEY=/org/mate/terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

dset() {
  local key="$1"; shift
  local val="$1"; shift

  "$DCONFTOOL" write "$PROFILE_KEY/$key" "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      "$DCONFTOOL" read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "'$val'"
    } | head -c-1 | tr "\n" ,
  )"

  "$DCONFTOOL" write "$key" "[$entries]"
}

# Append the Base16 profile to the profile list
glist_append /org/mate/terminal/global/profile-list "$PROFILE_SLUG"

dset visible-name "'$PROFILE_NAME'"
dset palette "'#232834:#1659df:#b29762:#e5ddcd:#3d75e6:#b29762:#728fcb:#8d95a5:#656e81:#1659df:#b29762:#e5ddcd:#3d75e6:#b29762:#728fcb:#dee6f7'"
dset background-color "'#232834'"
dset foreground-color "'#8d95a5'"
dset bold-color "'#8d95a5'"
dset bold-color-same-as-fg "true"
dset use-theme-colors "false"
dset use-theme-background "false"

