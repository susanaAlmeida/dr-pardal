gulp   = require 'gulp'
config = require '../config'
util   = require 'gulp-util'

gulp.task 'browser-sync', ->
  config.browserSync.init
    server:
      baseDir: config.dest
      routes:
        '/styles/fonts':          config.src + '/styles/fonts/'
        '/styles/images':         config.src + '/styles/images/'
        '*.json':                  config.src + '/data/'
        '/images':                config.src + '/images/'
        '/scripts/vendor':        config.src + '/scripts/vendor/'
        '/bower_components':      './bower_components/'

      middleware: (req, res, next) ->
        res.setHeader('Access-Control-Allow-Origin', '*')
        next()

    open: false
    xip: true
    notify: false
    https: util.env.cors
