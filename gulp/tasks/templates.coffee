gulp     = require 'gulp'
jade     = require('gulp-jade')
data     = require('gulp-data')
config   = require '../config'
plumber  = require 'gulp-plumber'

gulp.task 'templates', ->
    gulp.src(config.src + '/templates/pages/*.jade')
      .pipe plumber()
      .pipe(data((file) ->
        return {
          pageName: file.history[0]
            .replace(file.base, '')
            .replace('.jade', '')
        }
      ))
      .pipe(jade({pretty: true}))
      .pipe(gulp.dest(config.dest))
