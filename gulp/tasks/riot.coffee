gulp   = require 'gulp'
riot   = require 'gulp-riot'
config = require '../config'

gulp.task 'riot', ->
    gulp.src config.src + '/scripts/**/*.tag'
        .pipe riot type: 'coffeescript'
        .pipe gulp.dest config.dest + '/scripts'
