gulp    = require 'gulp'
config  = require '../config'
htmlmin = require 'gulp-htmlmin'

gulp.task 'htmlmin', ->
  gulp.src(config.dest + '/*.html')
    .pipe(htmlmin(collapseWhitespace: true))
    .pipe gulp.dest(config.dest)
