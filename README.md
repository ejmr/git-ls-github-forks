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
use Git terminology) for performing actions on every fork.  For
example, this script creates a remote branch for each fork:

```sh
#!/bin/sh

git ls-github-forks --name | while read URL USER
do
    git remote add "$USER" "$URL"
done
```


Installation
------------

1. Place the `src/git-ls-github-forks.sh` script in a directory where
   you have permissions to execute shell scripts.

2. Make sure your GitHub name is available, i.e. `git config --get
   github.user` must return your GitHub account name.

3. **Optional:** Create the alias to run the command as `git
   ls-github-forks`, for example:

```sh
$ git config --global --path alias.ls-github-forks "!sh /the/path/to/git-ls-github-forks.sh"
```


Requirements
------------

* [curl](http://curl.haxx.se/)
* [jq](http://stedolan.github.io/jq/)
* [mktemp](http://www.mktemp.org/)


Documentation
-------------

Running the program with `-h` will display information about the
available options.  If you have the programs [Pandoc][] and [Tup][]
then you can create a man page by running `tup upd` inside the
project’s directory.  If you only have Pandoc then you can create the
manual with the following command:

```sh
$ pandoc Manual.md --from=markdown --to=man --standalone --output=git-ls-github-forks.man
```

You can then run [man][] on the output file.


License
-------

[GNU General Public License](http://www.gnu.org/copyleft/gpl.html)

Copyright 2013 Eric James Michael Ritz



[Pandoc]: http://johnmacfarlane.net/pandoc/
[Tup]: http://gittup.org/tup/
[man]: http://primates.ximian.com/~flucifredi/man/
