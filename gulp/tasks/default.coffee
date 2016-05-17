gulp     = require 'gulp'
sequence = require 'run-sequence'

gulp.task 'default', [
    'clean'
    'iconfont'
    'templates'
    'copy'
    'styles'
    'coffee'
    'riot'
    'browser-sync'
    'watch'
]

gulp.task 'dist', [
    'clean'
    'templates'
    'iconfont'
    'copy:dist'
    'styles:dist'
    'coffee'
    'riot'
    'htmlmin'
], ->
    sequence(
        'usemin',
        'scripts:dist',
        # 'cache-bust'
        'clean:dist'
        'adjust-urls'
        'htmlmin'
    )
