path = require 'path'
exec = (require 'child_process').exec
gulp = require 'gulp'
insert = require 'gulp-insert'
rename = require 'gulp-rename'

paths =
  src: 'chapters/*.litcoffee'
  dst: '_chapters'

capitalize = (s) ->
  s[0].toUpperCase() + s.substr 1

insertFrontMatter = (contents, file) ->
  name = path.basename file.path
  matches = name.match /^(\d+)-([\w-]+).litcoffee$/
  return contents if not matches
  idx = parseInt matches[1]
  title = capitalize matches[2].replace /-/g, ' '
  frontMatter = """
  ---
  layout: chapter
  title: #{title}
  index: #{idx}
  ---

  """
  frontMatter + contents

renameToChapterIndex = (path) ->
  matches = path.basename.match /^(\d+)-([\w-]+)$/
  idx = parseInt matches[1]
  path.basename = idx

gulp.task 'build', ->
  gulp.src(paths.src)
    .pipe(insert.transform insertFrontMatter)
    .pipe(rename renameToChapterIndex)
    .pipe(gulp.dest paths.dst)
    .on 'end', ->
      exec 'jekyll build'

gulp.task 'default', ['build']
