gulp   = require 'gulp'
config = require '../config'
del    = require 'del'

gulp.task 'clean', ->
    del.sync [ config.dest + '/**' ]

gulp.task 'clean:dist', ->
    del.sync [ config.dest + '/styles/pages/*/' ]
    del.sync [ config.dest + '/scripts/common/' ]
