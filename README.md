<h1>BSPWM dotfiles for Arch Linux</h1>
Since Arch Linux comes with just the terminal out of the box, this is just a backup of personal system/settings/etc.. for future conveniency (All them scripts took quite a bit of time reseaching and writing). Use at our own risks.
<h2>Introduction:</h2>
Tiling window manager for the win!!!<br>
For this environent, I'm using:
<ul>
	<li><a href="https://github.com/baskerville/bspwm">BSPWM</a> for tiling window mananger</li>
	<li><a href="https://github.com/baskerville/sxhkd">sxhkd</a> manages keybindings</li>
	<li><a href="https://github.com/polybar/polybar">Polybar</a> for the status bar</li>
	<li><a href="https://github.com/neovim/neovim">NeoVim</a> as a text editor (you don't exit vim, <strong>vim exit you</strong>)</li>
	<li>Display manager <a href="https://github.com/canonical/lightdm">LightDM</a> handles GUI login and wallpaper</li>
	<li>Along with soooo many other things, refer to dependencies.txt for a full list of all things running in the system (this is currently on my TODO:)</li>
</ul>
<h2>Todo:</h2>
<ul>
	<li>Restructure files in the PC branch.</li>
	<li>Write an install script for PC systems.</li>
	<li>List out all dependencies in a .txt file for both branches.</li>
</ul>
<h2>Installation:</h2>

1. Clone the repos with <code>git clone https://github.com/halnguyen/dotfiles.git</code>.

2. For laptop, go into the "Mac" branch by:

		cd dotfile
		git checkout Mac

3. Run the install script with <code>./install.sh</code> and enter the sudo password if needed.
<h2>Troubleshooting</h2>
Reminder again that this is a personal backup, currently there will be no support in regard to troubleshooting for your own machine, please refer to the github page or (ArchWiki) for any bugs. But here are some dumb mistakes that I made in my system:
<ol>
	<li>Awesome font/Nerd fonts glyphs are not showing up in NeoVim, this is due to locale not being generated properly, refer to this <a href="https://wiki.archlinux.org/title/locale">documenation</a> on ArchWik for troubleshooting.</li>
	<li>Alacritty terminal emulator does not render icons for <code>lsd</code>, make sure that "JetBrains Mono Nerd Font" is at least the fall back font for <code>$HOME/.config/alacritty/alacritty.yaml</code></li>
	<li>SSH freezes, this is due to the wifi driver BCM4331, refer to this <a href="https://wiki.archlinux.org/title/broadcom_wireless#SSH_freeze_for_BCM4331_with_b43">documentation</a> on ArchWiki for troubleshooting</li>
</ol>
