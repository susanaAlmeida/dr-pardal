gulp   = require 'gulp'
config = require '../config'
bust   = require 'gulp-cache-bust'

gulp.task 'cache-bust', ->
    gulp.src config.dest + '/**/*.html'
        .pipe bust()
        .pipe gulp.dest config.dest
