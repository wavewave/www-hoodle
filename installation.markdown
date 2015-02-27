---
title: Installation
---

`hoodle` is published as several packages 
in [hackage](http://hackage.haskell.org/packages/hackage.html),  which is 
a collection of releases of Haskell packages. Current version of `hoodle` is 0.4.

You need to have `ghc-7.6` or higher, or equivalently haskell-platform-2014.2 or higher. `gtk2hs` is prerequisite and `poppler` (both C library and haskell binding) is also needed for pdf annotation.

----------

Prerequisite
===================

To use wacom tablet on linux systems, please install `xserver-xorg-input-wacom` or equivalent
(On Arch Linux, xf86-input-wacom). To make sure you have it installed, check whether `xsetwacom` exist in `/usr/bin`

Hoodle uses several external libraries and binary executable, such as [gtk+](http://www.gtk.org), 
[poppler library](http://poppler.freedesktop.org), 
[rsvg library](https://live.gnome.org/LibRsvg),  [gd library](https://bitbucket.org/pierrejoye/gd-libgd)
and [pdftk tool](http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit). 
In most linux distributions, these can be 
installed easily by package managers. For examples, on a ubuntu system, run (`$` represents bash prompt here) 
```
$ apt-get install libgtk2.0-dev librsvg2-dev libpoppler-glib-dev libgd2-xpm-dev pdftk
```

Before installing `hoodle`, `gtk2hs-buildtools` must be 
installed: 
```
cabal install gtk2hs-buildtools
```
Haskell binding libraries such as `gtk2hs` (for `gtk+`), `svgcairo` (for `rsvg`), `poppler` (for `poppler` C library) will 
be automatically installed. 

-----------

Hoodle Installation and Configuration
=====================================

Once `gtk2hs` and `poppler` are installed, then just type 

```
cabal install hoodle
```


Post-installation setup 
-----------------------

Hoodle has configuration file in `$HOME/.hoodle` and `$HOME/.hoodle.d`. 
The former is for basic configuration without using haskell, and the latter is for advanced 
configuration using haskell. In the following, I give some important remarks about configuration.   

### Setting subpixel X11 input for wacom digitizer
By default, `hoodle` does not use xinput extension which gives subpixel
resolution for wacom digitizer because of compatibility. To enable X11 input 
extension support, please do the following step. 

First, check your wacom devices using `xsetwacom --list devices`. 
In my case, the result is like the following: 
```
$ xsetwacom --list devices 
Wacom ISDv4 EC Pen stylus       	id: 9	type: STYLUS    
Wacom ISDv4 EC Pen eraser       	id: 13	type: ERASER   
```

Then, add the following line in `.hoodle` file in your `$HOME` directory.
```
stylus="Wacom ISDv4 EC Pen stylus"
eraser="Wacom ISDv4 EC Pen eraser"
 
xinput = "true"
```

The "Wacom ..." part must be replaced by the result from `xsetwacom --list devices`.

### Setting touch device 

Since version 0.2.1, `hoodle` now supports touch input. To enable touch, in the `$HOME/.hoodle` file, one needs to specify touch device. One can check the name of a touch device by
```
$ xinput --list
```

In my case, the result shows `Atmel Atmel maXTouch Digitizer`. Then, put the name of the device in `$HOME/.hoodle` like 
```
touch="Atmel Atmel maXTouch Digitizer"
```
You can turn touch on and off by a *hand* toolbar item. When a stylus pen approaches, the touch input is automatically turned off. 

 
### Scripting

Hoodle has a scripting support like `xmonad` if `hoodle-core` and `hoodle` cabal packages are compiled with `-fdyre` option. Once it is set up, `$HOME/.hoodle.d/start.hs` as a script will be automatically compiled using [dyre](http://hackage.haskell.org/package/dyre). Therefore you can customize your hoodle by `start.hs`. Currently, only a few hooks are available, but more and more hooks will be added in the future.

As an example, there is file name suggestion hook (using current
date/time) and custom context menu hook. (using this, I automatically
generate png image from selected items and put it on my dropbox
folder. This turned out extremely useful.)
See my example `start.hs` : [https://gist.github.com/4551914](https://gist.github.com/4551914)


## Windows Platform 

I have tested `hoodle-0.1` using Haskell Platform 2012.4.0.0 on Windows 7. Since I do not have working Windows machine now, I could not test the recent version. If you try, please let me know your story about it

## Nix

`hoodle` is now packaged in the `nixpkgs` repo of [Nix](http://nixos.org/nix) package manager and [NixOS](http://nixos.org). If you are a Nix user, this may be the best option for you.  


*CALL FOR PACKAGE MANAGER* : 
If anyone could create a binary package for hoodle for various linux 
distribution, windows and OS X, I would appreciate it very much. 


