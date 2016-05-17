gulp        = require 'gulp'
iconfont    = require 'gulp-iconfont'
config      = require '../config'
consolidate = require 'gulp-consolidate'
_           = require 'lodash'

fontOptions = _.extend({
  templatePattern: '{_classes.scss,_variables.scss}',
  fontName: 'icons',
  fontPath: 'icons',
  className: 'icon',
  fontWeight: 1001,
  normalize: true
})

gulp.task 'iconfont', ->
  gulp.src([ config.src + '/assets/icons/svgs/*.svg' ])
    .pipe(iconfont(fontOptions))
    .on 'glyphs', (glyphs, options) ->
      fontOptions.glyphs = glyphs
      gulp.src(config.src + '/assets/icons/templates/' + fontOptions.templatePattern)
        .pipe(consolidate('lodash', fontOptions))
        .pipe gulp.dest(config.src + '/styles/fonts/icons')
    .pipe gulp.dest(config.src + '/styles/fonts/' + fontOptions.fontName)
