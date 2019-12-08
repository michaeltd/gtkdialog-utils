#!/bin/bash

declare GTKDIALOG="$(command -v gtkdialog)"

digits_only() {
    echo "${*//[![:digit:]]}"
}

export hscalevol="$(digits_only "$(~/bin/sndvol report 2>&1)")"

export MAIN_DIALOG='
<window>
<vbox>
<hbox space-fill="true">
<menubar space-expand="true">
<menu use-underline="true">
<menuitem stock-id="gtk-network"><action>firefox &</action></menuitem>
<menuitem stock-id="gtk-edit"><action>emacsclient -c &</action></menuitem>
<menuitem stock-id="gtk-directory"><action>gentoo &</action></menuitem>
<menuitem stock-id="gtk-harddisk"><action>terminology &</action></menuitem>
<menuitem stock-id="gtk-quit" accel-key="0x51" accel-mods="4"><action>exit:Quit</action></menuitem>
<label>"_File"</label>
</menu>
<menu label="_Other" use-underline="true">
<menuitem stock-id="gtk-home" label="Stock Icon"></menuitem>
<menuitemseparator></menuitemseparator>
<menu image-name="" label="Image from File">
<menu icon-name="gimp" label="Theme Icon">
<menuitem label="Label Only"></menuitem>
</menu>
<height>16</height>
<width>16</width>
</menu>
</menu>
</menubar>
</hbox>
<hbox space-fill="true">
<button space-expand="true"><label>Left</label><action>xdotool key 'Super_L+Left'</action></button>
<button space-expand="true"><label>Right</label><action>xdotool key 'Super_L+Right'</action></button>
</hbox>
<hbox space-fill="true">
<hscale space-expand="true" range-min="0" range-max="100" range-step="5" range-value="'"${hscalevol}"'" value-pos="0" digits="0" inverted="false">
<variable export="true">hscalevol</variable>
<action>~/bin/sndvol ${hscalevol}</action>
</hscale>
</hbox>
<hbox space-fill="true">
<entry activates-default="true"><default>command to run</default><variable export="true">eRun</variable></entry>
<button can-default="true" has-default="true" tooltip-text="can-default, has-default"><label>Run: ...</label><variable>btnDefault</variable><action>${eRun} &</action></button>
</hbox>
</vbox>
</window>'

case "${1}" in
    -d | --dump) echo "${MAIN_DIALOG}" ;;
    *) "${GTKDIALOG}" --program=MAIN_DIALOG --geometry=+64+64;;
esac
