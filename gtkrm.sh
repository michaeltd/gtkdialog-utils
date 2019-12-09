#!/bin/bash

declare GTKDIALOG="$(command -v gtkdialog)"

digits_only() {
    echo "${*//[![:digit:]]}"
}

export hscalevol="$(digits_only "$(~/bin/sndvol report 2>&1)")"

export ABOUT_DIALOG='
<window title="README" icon-name="gtk-about" window-position="2" default-width="600" default-height="400" resizable="true">
	<vbox>
		<edit name="entReadMe" editable="false" can-focus="false">
			<input file>'"$(dirname "$(realpath "$(type -P gtkrm.sh 2> /dev/null)")")/readme.md"'</input>
        </edit>
        <hseparator></hseparator>
        <hbox>
			<button use-stock="true" label="gtk-ok" is-focus="true" width-request="90">
				<action>exit:Quit</action>
			</button>
		</hbox>
	</vbox>
</window>'

export MAIN_DIALOG='
<window>
    <vbox>
        <hbox space-fill="true">
              <menubar space-expand="true">
                       <menu label="_File" use-underline="true">
                             <menuitem stock-id="gtk-network"><action>firefox &</action></menuitem>
                             <menuitem stock-id="gtk-edit"><action>emacsclient -c &</action></menuitem>
                             <menuitem stock-id="gtk-directory"><action>gentoo &</action></menuitem>
                             <menuitem stock-id="gtk-harddisk"><action>terminology &</action></menuitem>
                             <menuitem stock-id="gtk-quit" accel-key="0x51" accel-mods="4"><action>exit:Quit</action></menuitem>
                       </menu>
                       <menu label="_Help" use-underline="true">
                             <menuitem stock-id="gtk-about" label="About"><action>'"${GTKDIALOG} --program=ABOUT_DIALOG"'</action></menuitem>
                       </menu>
              </menubar>
        </hbox>
        <hbox space-fill="true">
              <button space-expand="true"><input file stock="gtk-go-back"></input><action>xdotool key "Super_L+Left"</action></button>
              <button space-expand="true"><input file stock="gtk-go-forward"></input><action>xdotool key "Super_L+Right"</action></button>
        </hbox>
        <hbox space-fill="true">
              <hscale space-expand="true" range-min="0" range-max="100" range-step="5" range-value="'"${hscalevol}"'" value-pos="0" digits="0" inverted="false">
                      <variable export="true">hscalevol</variable>
                      <action>~/bin/sndvol ${hscalevol}</action>
              </hscale>
        </hbox>
        <hbox space-fill="true">
              <entry activates-default="true"><default>command</default><variable export="true">eRun</variable></entry>
              <button can-default="true" has-default="true" tooltip-text="can-default, has-default">
                      <input file stock="gtk-execute"></input>
                      <variable>btnDefault</variable>
                      <action>${eRun} &</action>
              </button>
        </hbox>
    </vbox>
</window>'

case "${1}" in
    -d | --dump) echo "${MAIN_DIALOG}";;
    *) "${GTKDIALOG}" --program=MAIN_DIALOG --geometry=+64+64;;
esac
