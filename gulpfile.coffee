fs = require 'fs'
path = require 'path'
exec = (require 'child_process').exec
gulp = require 'gulp'
insert = require 'gulp-insert'

paths =
  src: 'chapters/*.coffee.md'
  dst: 'pages'

chapters = fs.readdirSync path.dirname paths.src
last = chapters.length - 1

capitalize = (s) ->
  s[0].toUpperCase() + s.substr 1

insertFrontMatter = (contents, file) ->
  name = path.basename file.path
  matches = name.match /^(\d+)-([\w-]+).coffee.md$/
  return contents if not matches
  idx = parseInt matches[1]
  title = capitalize matches[2].replace /-/g, ' '
  frontMatter = """
  ---
  layout: chapter
  title: #{title}
  permalink: /chapters/#{idx}/
  chapter: #{idx}
  first: #{idx is 0}
  last: #{idx is last}
  ---

  """
  frontMatter + contents

gulp.task 'build', ->
  gulp.src(paths.src)
    .pipe(insert.transform insertFrontMatter)
    .pipe(gulp.dest paths.dst)
    .on 'end', ->
      exec 'jekyll build'


gulp.task 'default', ['build']
