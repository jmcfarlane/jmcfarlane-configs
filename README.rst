============
Installation
============

The first step is to clone this repo::

 git clone git://github.com/jmcfarlane/jmcfarlane-configs.git ~/dev/Configs

Conky
+++++

Simple, but useful::

 ln -s ~/dev/Configs/conkyrc ~/.conkyrc

Git
+++

Ignore common files::

 ln -s ~/dev/Configs/gitignore ~/.gitignore

Mpd
+++

The awesome mpd ran as non root user::

 ln -s ~/dev/Configs/mpdconf ~/.mpdconf

Screen
++++++

Make screen a bit easier to use::

 ln -s ~/dev/Configs/screenrc ~/.screenrc

Vim
+++

Install the dependencies::

 sudo apt-get install pyflakes exuberant-ctags

Vim with a few settings specific to Python::

 ln -s ~/dev/Configs/vimrc ~/.vimrc
 ln -s ~/dev/Configs/vim ~/.vim
