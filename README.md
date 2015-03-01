# A Coffee Fueled Adventure

> A Beginner's Guide to Programming in [CoffeeScript](http://coffeescript.org/)

So, you want to learn how to code? Great! This tutorial aims to help you get the basics down. It's divided up into a bunch of chapters which teaches different core concepts of programming.

Within these chapters, besides a bunch of text, you will find small snippets of code. It's recommended that the reader not just read these, but actually copy them and run them interactively using the CoffeeScript [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop). This hands-on approach will allow the reader to get familiar with writing pieces code. Eventually, the snippets will get more complex and you will want to move on to writing the code in text files.

A text editor that works great for this is [Atom](https://atom.io/), which incidentally is written in CoffeeScript itself. If Atom isn't your cup of coffee (okay, no more bad puns), you can take a look at the excellent [Sublime Text](http://www.sublimetext.com/) editor. Or you can just use your own favorite text editor, if you already have one.

At the end of each chapter, there will sometimes be a few exercises for the reader to solve. Usually, these are also solved by using the REPL, or writing a small script, but in some cases they will require the reader to modify an existing application. These applications are constructed as examples of how several of the concepts taught in this tutorial can be used in concert to solve a particular problem, or just create a fun app.

Since these applications are often run in the browser, they cannot be started like the rest of the snippets and scripts in this tutorial. To aid with this, each application has been equipped with a fully automated build environment using [gulp](http://gulpjs.com/). This means that all you need to do is run the `gulp` command and let gulp do all the hard work for you.

Before you start the tutorial you will want to follow the installation instructions found below to get everything set up.

## Chapters

0. [Types](chapters/00-types.coffee.md)
1. [Operations](chapters/01-operations.coffee.md)
2. [Variables](chapters/02-variables.coffee.md)
3. [Functions](chapters/03-functions.coffee.md)
4. [Conditionals](chapters/04-conditional-statements.coffee.md)
5. [Data structures](chapters/05-data-structures.coffee.md)
6. [Loops](chapters/06-loops.coffee.md)
7. [Classes](chapters/07-classes.coffee.md)
8. [Errors](chapters/08-errors.coffee.md)
9. [More operations](chapters/09-more-operations.coffee.md)

**Fun fact:** Since the chapters are written as literate CoffeeScript files, it means that you can actually run them! You can try it out with the following shell command:

```sh
coffee chapters/03-functions.coffee.md
```

## Installation

First of all, [Node.js](http://nodejs.org/) needs to be installed. You can find installation instructions on the Node.js website. Then, install CoffeeScript, Bower and gulp globally, with the following shell command:

```sh
npm install -g coffee-script bower gulp
```

Next up, we need to grab a few submodules:

```sh
git submodule update --init
```

Each submodule uses [npm](https://www.npmjs.com/) and [Bower](http://bower.io/) to track their dependencies. You can install them all at once using this command:

```sh
git submodule foreach 'npm install && bower install'
```

**Tip:** If you need some more help with the installation; check out the [wiki](https://github.com/FredrikAppelros/coffee-adventure/wiki/Installation)!
