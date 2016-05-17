gulp        = require 'gulp'
config      = require '../config'
urlAdjuster = require 'gulp-css-url-adjuster'
minifycss   = require 'gulp-minify-css'
util        = require 'gulp-util'
gulpif      = require 'gulp-if'
colors      = require 'colors'

gulp.task 'adjust-urls', ->
    prefix = '/'

    if util.env.prefix isnt undefined
        prefix = util.env.prefix

    if prefix isnt undefined
        console.log(
            'Notice:'.yellow, 'Using', "#{prefix}".green,
            'as the prefix for CSS URLs'
        )

    gulp.src config.dest + '/styles/**/*.css'
        .pipe gulpif(prefix isnt '', urlAdjuster({
            replace: [ "/styles/images/", "#{prefix}/styles/images/" ]
        }))
        .pipe minifycss keepSpecialComments: 0
        .pipe gulp.dest config.dest + '/styles'
