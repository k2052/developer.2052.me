# What is this?

This is the source for [developer.k2052.me](http://developer.k2052.me). It is 99% static and is built using
[middleman](http://middlemanapp.com).

You are free to utilize and learn from anything (Licensed under MIT). Feel free to deploy a site using
this as a starting point, just change the design and images enough that it doesn't interfere with my brand (i.e confuse people).

## Building and Publishing

Everything is done using [middleman-gh-pages](https://github.com/neo/middleman-gh-pages), so follow the instructions contained in its README. The is a rake task that will automatically build and call `middleman deploy`


```sh
$ bundle exec rake deploy
```
