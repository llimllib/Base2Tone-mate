#!/usr/bin/env bash
# Base2Tone-Desert - Mate Terminal color scheme install script
# by Bram de Haan, adapted from DuoTone themes by Simurai (http://simurai.com/projects/2016/01/01/duotone-themes)
# generated by https://github.com/base16-builder/base16-builder

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Base2Tone-Desert Dark"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-base-2-tone-desert-dark"
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
dset palette "'#292724:#816f4b:#ec9255:#ffb380:#957e50:#ec9255:#ac8e53:#ada594:#7e7767:#816f4b:#ec9255:#ffb380:#957e50:#ec9255:#ac8e53:#f2ead9'"
dset background-color "'#292724'"
dset foreground-color "'#ada594'"
dset bold-color "'#ada594'"
dset bold-color-same-as-fg "true"
dset use-theme-colors "false"
dset use-theme-background "false"

