[copernicium][wiki]
===================


[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)
[![Gem Version](https://badge.fury.io/rb/copernicium.svg)](https://badge.fury.io/rb/copernicium)
[![Build Status](https://travis-ci.org/jeremywrnr/copernicium.svg)](https://travis-ci.org/jeremywrnr/copernicium)
[![Code Climate](https://codeclimate.com/github/jeremywrnr/copernicium/badges/gpa.svg)](https://codeclimate.com/github/jeremywrnr/copernicium)


Repository for Team Copernicium's DVCS.


### installation

    $ [sudo] gem install copernicium


### cn usage

##### starting out

    init - create a new repository
    status - check repo status
    history - show repo commits
    help - show more commands

##### commands

    commit [files] <-m message>
    branch [opt] [branch]
      -r | rename current branch
      -c | create a new branch
      -d | delete a branch
    checkout <commit id> [files]
    clean [files] [commit/branch]
    clone <user> <remote url>
    push <user> <remote url>
    pull <user> <remote url>
    merge <branch>

##### options

    -v: print version
    -h: show help

Note: `[optional] <required>`


### troubleshooting

Note: clone, push and pull require ssh keys to be setup on the hosting server.

If you are having trouble installing Copernicium as a ruby gem, you can try the
following to install it in a PATH folder where you have write access. For
example, this will install cn in ~/bin:

    $ gem install copernicium -n~/bin


### ssh keys

If SSH keys are not setup, you will be required to provide a user and password
for each use of the push, pull and clone methods.  In order to avoid this, SSH
keys can be used, which allow the user to only supply a password.  First,
change to the .ssh folder in the home directory of the user:

	$ cd ~/.ssh

To generate an ssh key on the local machine, use the command:

	$ ssh-keygen -t dsa

Use the provided configurations from the program and do not enter a password.
Once this is done, you will have the files id_dsa and id_dsa.pub in the .ssh
folder. You will need to move the contents of the public key to your remote
server. Copy the contents of the id_dsa.pub file and log onto the remote
server. Navigate to the .ssh folder and open the authorized_keys file and add
the contents of the public key to a line:

	$ cd ~/.ssh
	$ echo [public key info] > authorized_keys

You should now be able to use the push, pull, and origin functions using only
the username.


### development

First, clone this repository:

    $ git clone https://github.com/jeremywrnr/copernicium.git

To install all runtime and testing dependencies, run:

    $ [sudo] gem install rake
    $ rake setup

To run the entire test suite, run `rake test`. To run a specific test suite:

    $ rake test[pushpull]

To show information about each module's tests, and branches commits, run:

    $ rake info


### relevant links:

- [spec. documentation](https://docs.google.com/document/d/1r3-NquhyRLbCncqTOQPwsznSZ-en6G6xzLbWIAmxhys/)
- [shared google drive](https://drive.google.com/open?id=0B3rmOUWm5OBlNzRnZTZEajFWZkU)
- [ruby style guide](https://github.com/styleguide/ruby)
- [build history](https://travis-ci.org/jeremywrnr/copernicium/builds)
- [messenger chat](https://www.messenger.com/t/563048860513155)
- [asana tasks](https://app.asana.com/0/56905660582491/calendar)


### todos

- checkout commits by semantic id
- refactor ui logic code into modules


[wiki]:https://en.wikipedia.org/wiki/Copernicium

