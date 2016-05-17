gulp     = require 'gulp'
config   = require '../config'
coffee   = require 'gulp-coffee'
concat   = require 'gulp-concat'
plumber  = require 'gulp-plumber'
notifier = require 'node-notifier'
colors   = require 'colors'
path     = require 'path'

onError = (error) ->
    console.log '\nERROR:'.red
    console.log '    File:'.yellow, "#{error.filename}"
    console.log ' Message:'.yellow, "#{error.message}"
    console.log 'Location:'.yellow, "#{error.location.first_line}:#{error.location.first_column}\n"

    notifier.notify
        title:    'Coffee error'
        subtitle: error.message
        message:  error.filename.replace process.cwd(), ''

gulp.task 'coffee', ->
    gulp.src config.src + '/scripts/*.coffee'
        .pipe plumber()
        .pipe coffee bare: true
        .on 'error', onError
        .pipe concat 'app.js'
        .pipe gulp.dest config.dest + '/scripts'

    gulp.src config.src + '/scripts/pages/**/*.coffee'
        .pipe plumber()
        .pipe coffee bare: true
        .on 'error', onError
        .pipe gulp.dest config.dest + '/scripts/pages'

    gulp.src config.src + '/scripts/common/**/*.coffee'
        .pipe plumber()
        .pipe coffee bare: true
        .on 'error', onError
        .pipe gulp.dest config.dest + '/scripts/common'

    gulp.src config.src + '/scripts/mixins/**/*.coffee'
        .pipe plumber()
        .pipe coffee bare: true
        .on 'error', onError
        .pipe gulp.dest config.dest + '/scripts/mixins'

    gulp.src config.src + '/scripts/stores/**/*.coffee'
        .pipe plumber()
        .pipe coffee bare: true
        .on 'error', onError
        .pipe gulp.dest config.dest + '/scripts/stores'
