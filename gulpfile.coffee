fs = require 'fs'
path = require 'path'
gulp = require 'gulp'
insert = require 'gulp-insert'

paths =
  src: 'chapters/*.coffee.md'
  dst: 'pages'

chapters = fs.readdirSync path.dirname paths.src
last = chapters.length - 1

insertFrontMatter = (contents, file) ->
  name = path.basename file.path
  matches = name.match /^(\d+)-([\w-]+).coffee.md$/
  return contents if not matches
  idx = parseInt matches[1]
  title = matches[2].replace /-/g, ' '
  frontMatter = """
  ---
  layout: chapter
  title: #{title}
  permalink: /chapters/#{idx}/
  chapter: #{idx}
  """
  frontMatter += '\nfirst: true' if idx is 0
  frontMatter += '\nlast: true' if idx is last
  frontMatter += '\n---\n'
  frontMatter + contents

gulp.task 'build', ->
  gulp.src(paths.src)
    .pipe(insert.transform insertFrontMatter)
    .pipe(gulp.dest paths.dst)

gulp.task 'default', ['build']
