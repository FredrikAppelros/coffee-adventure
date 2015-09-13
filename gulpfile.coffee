path = require 'path'
exec = (require 'child_process').exec
gulp = require 'gulp'
insert = require 'gulp-insert'
rename = require 'gulp-rename'

paths =
  chapters:
    src: 'chapters/*.litcoffee'
    dst: '_chapters'
  exercises:
    src: 'exercises/**/*.litcoffee'
    dst: '_exercises'
  answers:
    src: 'answers/**/*.litcoffee'
    dst: '_answers'

capitalize = (s) ->
  s[0].toUpperCase() + s.substr 1

createFrontMatter = (config) ->
  frontMatter = """
  ---
  #{("#{k}: #{v}" for k, v of config).join '\n'}
  ---

  """
  frontMatter

getChapterConfig = (name) ->
  matches = name.match /^(\d+)-([\w-]+).litcoffee$/
  idx = matches[1]
  title = capitalize matches[2].replace /-/g, ' '
  config =
    layout: 'chapter'
    title: title
    index: idx

getExerciseConfig = (name) ->
  matches = name.match /^(\d+)\/(\d+).litcoffee$/
  chapter = matches[1]
  idx = matches[2]
  config =
    chapter: chapter
    index: idx

insertChapterFrontMatter = (contents, file) ->
  config = getChapterConfig file.relative
  frontMatter = createFrontMatter config
  frontMatter + contents

insertExerciseFrontMatter = (contents, file) ->
  config = getExerciseConfig file.relative
  frontMatter = createFrontMatter config
  frontMatter + contents

renameToChapterIndex = (path) ->
  matches = path.basename.match /^(\d+)-([\w-]+)$/
  idx = matches[1]
  path.basename = idx

gulp.task 'chapters', ->
  gulp.src(paths.chapters.src)
    .pipe(insert.transform insertChapterFrontMatter)
    .pipe(rename renameToChapterIndex)
    .pipe(gulp.dest paths.chapters.dst)

gulp.task 'exercises', ->
  gulp.src(paths.exercises.src)
    .pipe(insert.transform insertExerciseFrontMatter)
    .pipe(gulp.dest paths.exercises.dst)

gulp.task 'answers', ->
  gulp.src(paths.answers.src)
    .pipe(insert.transform insertExerciseFrontMatter)
    .pipe(gulp.dest paths.answers.dst)

gulp.task 'build', ['chapters', 'exercises', 'answers'], ->
  exec 'jekyll build'

gulp.task 'default', ['build']
