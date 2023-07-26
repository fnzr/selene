/* Copyright 2020 ZSA Technology Labs, Inc <@zsa>
 * Copyright 2020 Jack Humbert <jack.humb@gmail.com>
 * Copyright 2020 Christopher Courtney, aka Drashna Jael're  (@drashna) <drashna@live.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */



#include QMK_KEYBOARD_H
#include "version.h"
#include "tap_hold.c"

enum layers {
    BASE,  // default layer
    SYMB,  // symbols
    MDIA,  // media keys
};

enum {
    TD_OSM_LCTL,
    TD_OSM_LSFT,
};

enum custom_keycodes {
    VRSN = SAFE_RANGE,
};

// clang-format off

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    tap_dance_action_t *action;
    switch (keycode) {
        /* case VRSN: */
        /*     SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION); */
        /*         return false; */
        case TD(TD_OSM_LCTL):
        case TD(TD_OSM_LSFT):
            action = &tap_dance_actions[TD_INDEX(keycode)];
            if (!record->event.pressed && action->state.count && !action->state.finished) {
                tap_dance_osm_t *tap_hold = (tap_dance_osm_t *)action->user_data;
                set_oneshot_mods(MOD_BIT(tap_hold->mod));
            }
            break;
    }

    return true;
}

tap_dance_action_t tap_dance_actions[] = {
	[TD_OSM_LCTL] =  ACTION_TAP_OSM(KC_LCTL),
	[TD_OSM_LSFT] =  ACTION_TAP_OSM(KC_LSFT),
};

#include "keymap.g.c"
