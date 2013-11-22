Aunit on Ubuntu 12.04.3
=======================
In the beginning of the project we had used Adacore Libre 2012 or 2013 for all
our development and building. After a few months we moved to the pre-built
packages available within Debian/Ubuntu for various reasons. One downside of
this move was that the old version of Aunit in gnat-4.6 was not working with
the test code we had already written. The libaunit3 package available in the
repository did not come with any valuable functionality either.

The solution to this was to download and compile Aunit3 on our own. Go to
http://libre.adacore.com/download/configurations and "select your platform".
As we used Ubuntu 12.04.3 64-bit, x86_64-linux was our choice.

From 2013 and forward Aunit is bundled with GNAT so in the list
chose GNAT 2013 by pressing the small arrow to the left. Then press the arrow
next to "sources" and download ´´´aunit-gpl-2013-src.tgz´´´.

´´´
tar xvf aunit-gpl-2013-src.tgz
cd aunit-gpl-2013-src
make
make install

**Remember set required paths as well**
ADA_PROJECT_PATH=/usr/lib/gnat
and/or
GPR_PROJECT_PATH=/usr/lib/gnat
´´´
