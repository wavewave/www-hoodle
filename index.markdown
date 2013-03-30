---
title: free pen note taking program
---


 
<p> 
Hoodle is a pen notetaking program developed in 
[Haskell](http://www.haskell.org) 
using <code>gtk2hs</code> (Haskell binding to <code>gtk</code> library). 
</p>

<iframe width="560" height="315" src="http://www.youtube.com/embed/Z2wzpyxsVSU" frameborder="0" allowfullscreen></iframe>


This project started as making a clone of [xournal](http://xournal.sourceforge.net), 
a notetaking program developed in C.  
Now <code>hoodle</code> works quite equivalent as <code>xournal</code> and 
has more unique functionalities.

Haskell is a much safer and higher-level language than C while still maintaining good performance. We can develop hoodle much more quickly with fewer bugs.

As <code>xournal</code>, <code>hoodle</code> can take wacom tablet 
X11 input in subpixel unit so that it can result in very smooth notetaking
experience.  The file format (.hdl format) is very similar to 
the file format of <code>xournal</code> (.xoj format) (although it is planned 
to be significantly changed as the development is more progressed).
 Xournal xoj files can be read directly from <code>hoodle</code>. 

Currently, to install <code>hoodle</code>, your system should have 
<code>ghc-7.0</code> or higher, and [Haskell Platform](http://www.haskell.org/platform) 2011.2 or higher, or 
equivalent libraries 
(Haskell Platform is a set of standard libraries in 
Haskell). 

Installing <code>hoodle</code> should be very simple using <code>cabal-install</code> which is a standard package build tool in Haskell: <pre> <code>
> cabal update
> cabal install hoodle
</code></pre>

Features 
---------

- pdf annotation

- *Split view pane* : hoodle can make a split view (horizontal and vertical and
arbitrary combination of them) of the same document similarly to 
<code>emacs</code> buffers and windows. Try Horizontal/Vertical 
Split in View menu of the program. This will be convenient when notetaking 
a long document.
    
**Google group mailing list** : <http://groups.google.com/group/hoodle>
