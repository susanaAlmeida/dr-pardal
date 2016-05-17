gulp        = require 'gulp'
config      = require '../config'
watch       = require 'gulp-watch'
sequence    = require 'run-sequence'
browserSync = require 'browser-sync'

gulp.task 'reload', ->
    browserSync.reload()

gulp.task 'watch', ->
    watch config.src + '/scripts/**/*.coffee', ->
        sequence 'coffee', 'reload'

    watch config.src + '/scripts/**/*.tag', ->
        sequence 'riot', 'reload'

    watch config.src + '/styles/**/*.scss', ->
        gulp.start 'styles'

    watch config.src + '/templates/**/*.jade', ->
      sequence 'templates', 'reload'

    watch config.src + '/assets/icons/svgs/*.svgs', ->
        sequence 'iconfont', 'styles', 'reload'
