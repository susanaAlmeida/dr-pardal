gulp         = require 'gulp'
config       = require '../config'
handleErrors = require '../util/handleErrors'
plumber      = require 'gulp-plumber'
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
browserSync  = require 'browser-sync'
minifycss    = require 'gulp-minify-css'

gulp.task 'styles', ->
    gulp.src config.src + '/styles/**/*.scss'
        .pipe plumber()
        .pipe sass
            sourceComments: 'normal'
            includePaths: config.sass.includePaths
        .on 'error', handleErrors
        .pipe autoprefixer 'last 3 version'
        .pipe gulp.dest config.dest + '/styles'
        .pipe browserSync.reload stream:true

gulp.task 'styles:dist',  ->
    gulp.src config.src + '/styles/**/*.scss'
        .pipe plumber()
        .pipe sass
            includePaths: config.sass.includePaths
        .on 'error', handleErrors
        .on 'error', (err) ->
            console.log 'Error:', err
        .pipe autoprefixer 'last 3 version'
        .pipe gulp.dest config.dest + '/styles'
