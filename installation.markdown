---
title: Installation
---

<code>hoodle</code> is published as several packages 
in [hackage](http://hackage.haskell.org/packages/hackage.html),  which is 
a collection of releases of Haskell packages. Current version of <code>hoodle</code> is 0.2.

If your system has ghc-7.4 or higher and haskell-platform-2012.2 or higher, and you have
installed gtk2hs and some of its subpackage (e.g. cairo, poppler), then the installation will 
be easy. 

----------

Prerequisite
===================

Hoodle uses several external libraries and binary executable, such as [gtk+](http://www.gtk.org), 
[poppler library](http://poppler.freedesktop.org), 
[rsvg library](https://live.gnome.org/LibRsvg),  [gd library](https://bitbucket.org/pierrejoye/gd-libgd)
and [pdftk tool](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit). 
In most linux distributions, these can be 
installed easily by package managers. Here, I explain how to install them in some detail.

gtk2hs installation
------------------- 

<code>gtk2hs</code> is a haskell binding to the <code>gtk</code> library. To install it, your system 
should have the <code>gtk+-2.0</code> library. Then, install <code>gtk2hs-buildtools</code> by 
using <pre><code>> cabal install gtk2hs-buildtools </code> </pre> 
and install <code>gtk</code> (which automatically installs cairo) 
by <pre><code> > cabal install gtk </code> </pre>

poppler installation
--------------------

<code>poppler</code> is a pdf rendering library. <code>poppler</code> in Haksell is a Haskell binding for 
the library. To install <code>poppler</code> package in Haskell, you need to install glib version of 
poppler. (The corresponding package is usually named as <code>poppler-glib</code> in many linux distributions)
After installing the <code>poppler</code> library, install haskell <code>poppler</code> library 
by  <pre><code>> cabal install poppler </code></pre>
(in fact, this <code>cabal-install</code> step is not needed because cabal automatically installs required 
dependencies.)

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


