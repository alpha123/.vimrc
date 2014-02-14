.vimrc
======

A short & sweet configuration for Vim 7.4, optimized for web design and front-end web development.

Rationale
---------
I got tired of using pre-built Vim configs because they were usually slow, loaded with stuff I don’t need, and confusing to customize. So I started growing my own, and then I decided, “Hey, this became a useful config. I need to get this on my other computers and might as well share it with the public in the process.”
It’s meant to be first and foremost simple and easy to hack on. There’s nothing special about it; it’s the stuff you would write in a new .vimrc anyway.

Installation
------------
Grab the patched Anonymous Pro font (“Anonymice Powerline”) from (Lokaltog/powerline-fonts)[1], or use a font of your choice and adjust .vimrc (search for “Anonymice Powerline”). If your font isn’t patched to contain powerline/airline symbols, disable those by changing the airline setting to 0 (search for “airline_powerline_fonts”).

Also install Exuberant Ctags if you haven’t already. (And if you haven’t, shame on you! You’re missing out.) Alternatively, just remove the taglist.vim and tagbar plugins, but I highly recommend ctags.

Then just [download my .vimrc][2] and copy it to wherever your OS puts yours. It’s not meant to be cloned because it’s meant for you to customize. My .vimrc should just be a solid base for yours, plus some packages helpful for front-end work. Those are delete-key friendly if you don’t do web.

[1]: https://github.com/Lokaltog/powerline-fonts
[2]: https://raw2.github.com/alpha123/.vimrc/master/.vimrc
