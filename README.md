# Teaching Apps

This is to be a set of exercises for an introductory programming course. It has yet to be completed.

The language used throughout the exercises will be [CoffeeScript](http://coffeescript.org/). Some exercises will also contain a small amount of [HTML](http://www.w3.org/html/) and [Less](http://lesscss.org/), but it will not be the primary focus.

## Installation

First of all, [Node.js](http://nodejs.org/) needs to be installed. You can find installation instructions on the Node.js website. Using [npm](https://www.npmjs.com/), install both [gulp](http://gulpjs.com/) and [bower](http://bower.io/) globally:

```
npm install -g gulp bower
```

Next up, the individual exercises needs to be checked out. This is done by doing a submodule update with git.

```
git submodule update --init
```

Lastly, the local packages in each exercise needs to be installed. This can be achieved by running the following:

```
git submodule foreach 'npm install && bower install'
```

## Usage

Each exercise contains its own README file where you will find installation instructions for that particular exercise. If you followed the installation instructions listed here, you can skip them. It will also contain instructions on how to complete the exercise.

It will start out with a few small problems for you to to solve before moving on to completing the main exercise.

Generally, to run the exercise, all you need to do is to launch gulp:

```
gulp
```

Gulp will then watch for changes to your files and automatically compile and run them for you. In most cases this will include starting a small server that hosts the app and launching a browser that points to it. The browser window will also be refreshed automatically when any change is detected.
