gulp       = require 'gulp'
config     = require '../config'
uglify     = require 'gulp-uglify'
stripDebug = require 'gulp-strip-debug'

gulp.task 'scripts', ->
    gulp.src config.dest + '/scripts/scripts.js'
        .pipe stripDebug()
        .pipe uglify()
        .pipe gulp.dest config.dest + '/scripts'

gulp.task 'scripts:dist', ->
    gulp.src config.dest + '/scripts/**/*.js'
        .pipe stripDebug()
        .pipe uglify()
        .pipe gulp.dest config.dest + '/scripts'
