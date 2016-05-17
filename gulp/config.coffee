browserSync = require 'browser-sync'

src         = "./src"
dest        = "./dist"

module.exports =
    src: src
    dest: dest

    browserSync: browserSync

    sass:
        includePaths: [
            'bower_components'
            './'
        ]
