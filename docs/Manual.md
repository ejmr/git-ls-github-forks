% GIT-LS-GITHUB-FORKS(1) | Version 1.0.0
% Eric James Michael Ritz
% 15 July 2013

NAME
====

git-ls-github-forks - Lists all forks of a project on GitHub

SYNOPSIS
========

git ls-github-forks **[options]**

DESCRIPTION
===========

Running this program inside of a Git repository will list the URLs for
all forks of that project on GitHub.  Of course, this assumes the
repository where you run the program is a project that is publicly
available on GitHub.  The URLs for all forks appear on standard output
with one line per URL.

OPTIONS
=======

-f, --format *[format]*
  : Displays the URLs in the style of *[format]*, which must be one of
    the following: `git`, `http`, `svn`, `ssh`, or `api`.  The default
    value is `git`.

-n, --name
  : Show the GitHub username of the person who owns the fork.

-s, --sort *[property]*
  : Sort all URLs based on *[property]*, which must one of the
    following: `newest`, `oldest`, or `watchers`.  The default is
    `newest`, which lists forks with the most recent changes first.

--rate-limit
  : GitHub places an hourly limit on the number of API requests the
    program can make.  This option shows two values: the number of
    remaining requests available and the date and time when the amount
    of requests allowed will reset to its maximum value.  Using this
    option does not count against the number of remaining requests.
    The program will exit without displaying any forks if given this
    option, which makes it mutually exclusive to the default behavior
    of listing forks.

--verbose
  : The program saves the response from GitHub in a temporary file
    debugging purposes.  This option will print that filename to
    standard error.

--usage
  : Show the usage and options.

--version
  : Show the current version number.

EXIT STATUS
===========

All status codes except for zero represent errors.

* 0 Success

* 1 Unrecognized command-line option

* 2 Could not find the remote repository on GitHub

* 3 Could not find the [mktemp](http://www.mktemp.org/) program
