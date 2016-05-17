gulp   = require 'gulp'
config = require '../config'

gulp.task 'copy', ->
  # Data
  gulp.src config.src + '/data/**/*'
      .pipe gulp.dest config.dest + '/'


gulp.task 'copy:dist', ->
  # Fonts
  gulp.src config.src + '/styles/fonts/**/*.{ttf,eot,woff,woff2,svg}'
      .pipe gulp.dest config.dest + '/styles/fonts'

  # Images
  gulp.src config.src + '/images/**/*'
      .pipe gulp.dest config.dest + '/images'

  # Scripts
  gulp.src config.src + '/scripts/vendor/**/*.js'
      .pipe gulp.dest config.dest + '/scripts/vendor'

  # CSS Images
  gulp.src config.src + '/styles/images/**/*'
      .pipe gulp.dest config.dest + '/styles/images'

  # Data
  gulp.src config.src + '/data/**/*'
      .pipe gulp.dest config.dest + '/'
