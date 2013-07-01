List GitHub Forks From the Command-Line
=======================================

This project provides a utility command for [Git](http://git-scm.org/):

```sh
# The current directory is the one for this project repository,
# e.g. /home/eric/Projects/git-ls-github-forks.

$ git ls-github-forks
git://github.com/eiyukabe/git-ls-github-forks
git://github.com/charlestonsoftware/git-ls-github-forks
git://github.com/Skrath/git-ls-github-forks
git://github.com/valdest/git-ls-github-forks
```

Running the command inside of a Git repository will list URLs to all
public forks on GitHub.  This acts as a low-level ‘plumbing’ command (to
use Git terminology) for performing actions on every fork,
e.g. comparing updates, cloning forks, making remote branches for
certain forks, and so on.


Installation
------------

1. Place the `src/git-ls-github-forks.sh` script in a directory where
   you have permissions to execute shell scripts.

2. Make sure your GitHub name is available, i.e. `git config --get
   github.user` must return your GitHub account name.

3. **Optional:** Create the alias `git config --global --path
   alias.ls-github-forks "!sh /the/path/to/git-ls-github-forks.sh"`.
   This lets you run the command as `git ls-github-forks`.


Requirements
------------

* [curl](http://curl.haxx.se/)
* [jq](http://stedolan.github.io/jq/)


Upcoming Features
-----------------

The program uses [Semantic Versioning](http://semver.org/) and is
currently going through unstable development.  Features for the stable
version 1.0.0 will include:

* Display fork URLs in different formats, e.g. using HTTPS or SVN.

* The ability to sort fork URLs based on the number of commits, most
  recent updates, number of watchers, and other statistics.

* A complete [man page](https://www.kernel.org/doc/man-pages/).

* Support for HTTP redirections which GitHub may send.

* Make use of the `If-Modified-Since` header to help avoid exceeding
  GitHub’s limit on the number of API requests allowed per hour.

* Support for all major operating systems.  Current support is for
  Linux only.


License
-------

[GNU General Public License](http://www.gnu.org/copyleft/gpl.html)

Copyright 2013 Eric James Michael Ritz
