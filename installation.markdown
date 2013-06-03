---
title: Installation
---

<code>hoodle</code> is published as several packages 
in [hackage](http://hackage.haskell.org/packages/hackage.html),  which is 
a collection of releases of Haskell packages. Current version of <code>hoodle</code> is 0.2.1.

If your system has ghc-7.4 or higher and haskell-platform-2012.2 or higher, and you have
installed gtk2hs and some of its subpackage (e.g. cairo, poppler), then the installation will 
be easy. 

----------

Prerequisite
===================

To use wacom tablet on linux systems, please install <code>xserver-xorg-input-wacom</code> or equivalent
(On Arch Linux, xf86-input-wacom). To make sure you have it installed, check whether <code>xsetwacom</code> exist in <code>/usr/bin</code>

Hoodle uses several external libraries and binary executable, such as [gtk+](http://www.gtk.org), 
[poppler library](http://poppler.freedesktop.org), 
[rsvg library](https://live.gnome.org/LibRsvg),  [gd library](https://bitbucket.org/pierrejoye/gd-libgd)
and [pdftk tool](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit). 
In most linux distributions, these can be 
installed easily by package managers. For examples, on a ubuntu system, run <pre><code>> apt-get install libgtk2.0-dev librsvg2-dev libpoppler-glib-dev libgd2-xpm-dev pdftk </code></pre>

Before installing <code>hoodle</code>, <code>gtk2hs-buildtools</code> must be 
installed: <pre><code>> cabal install gtk2hs-buildtools</code></pre>
Haskell binding libraries such as gtk2hs (for gtk+), svgcairo (for rsvg), poppler (for poppler) will 
be automatically installed. 

-----------

Hoodle Installation and Configuration
=====================================

Once <code>gtk2hs</code> and <code>poppler</code> are installed, then just type <pre><code>> cabal install hoodle  </code>  </pre> 


Post-installation setup 
-----------------------

Hoodle has configuration file in <code> $HOME/.hoodle </code> and <code> $HOME/.hoodle.d</code>. 
The former is for basic configuration without using haskell, and the latter is for advanced 
configuration using haskell. In the following, I give some important remarks about configuration.   

### Setting subpixel X11 input for wacom digitizer
By default, <code>hoodle</code> does not use xinput extension which gives subpixel
resolution for wacom digitizer because of compatibility. To enable X11 input 
extension support, please do the following step. 

First, check your wacom devices using <code>xsetwacom --list devices</code>. 
In my case, the result is like the following: <pre><code>> xsetwacom --list devices 
Wacom ISDv4 EC Pen stylus       	id: 9	type: STYLUS    
Wacom ISDv4 EC Pen eraser       	id: 13	type: ERASER   
</code>
</pre>

Then, add the following line in .hoodle file in your <code>$HOME</code> directory. <pre>
<code>stylus="Wacom ISDv4 EC Pen stylus"
eraser="Wacom ISDv4 EC Pen eraser"
 
xinput = "true"
</code>
</pre>
The "Wacom ..." part must be replaced by the result from <code>xsetwacom --list devices</code>.

### Setting touch device 

Since version 0.2.1, <code>hoodle</code> now supports touch input. To enable touch, in the <code>$HOME/.hoodle</code> file, one needs to specify touch device. One can check the name of a touch device by<pre><code>> xinput --list
</code>
</pre> 

In my case, the result shows <code>Atmel Atmel maXTouch Digitizer</code>. Then, put the name of the device in <code>$HOME/.hoodle</code> like <pre><code>touch="Atmel Atmel maXTouch Digitizer"</code></pre>
You can turn touch on and off by a *hand* toolbar item. When a stylus pen approaches, the touch input is automatically turned off. 

 
### Scripting

Hoodle has a scripting support like <code>xmonad</code>. If you have
<code>$HOME/.hoodle.d/start.hs</code>, then the script will be automatically
set up using the <code>dyre</code> package. By changing <code>start.hs</code>, 
you can customize your hoodle. Currently, only a few hooks are available, 
but more and more hooks will be added in the future.

As an example, there is file name suggestion hook (using current
date/time) and custom context menu hook. (using this, I automatically
generate png image from selected items and put it on my dropbox
folder. This turned out extremely useful.)
See my example <code>start.hs</code>  : [https://gist.github.com/4551914](https://gist.github.com/4551914)


## Windows Platform 

Without poppler, with Haskell Platform 2012.4.0.0, hoodle is tested on Windows 7 
machine. Detailed instruction will be updated soon. 


*CALL FOR PACKAGE MANAGER* : 
If anyone could create a binary package for hoodle for various linux 
distribution, windows and mac os X, I would appreciate it very much. 


