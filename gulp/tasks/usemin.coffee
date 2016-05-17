gulp   = require 'gulp'
usemin = require 'gulp-usemin'
config = require '../config'

gulp.task 'usemin', ->
    gulp.src config.dest + '/**/*.html'
        .pipe usemin()
        .pipe gulp.dest config.dest
