var gulp = require('gulp-help')(require('gulp'));

require('coffee-script/register');
require('require-dir')('./gulp/tasks', { recurse: true });
