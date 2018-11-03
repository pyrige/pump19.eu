var gulp = require('gulp');

var concat = require('gulp-concat');
var cssmin = require('gulp-cssmin');
var prefix = require('gulp-autoprefixer');
var sass = require('gulp-sass');
var streamify = require('gulp-streamify');
var uglify = require('gulp-uglify');

var browserify = require('browserify');
var pump = require('pump');
var runSequence = require('run-sequence');
var source = require('vinyl-source-stream');

var sassPaths = [
  './node_modules/@mdi/font/scss',
  './node_modules/roboto-fontface/css/roboto/sass',
  './node_modules/roboto-fontface/css/roboto-slab/sass',

  './node_modules',
];

gulp.task('fonts', function(cb) {
  pump([
    gulp.src([
      './node_modules/@mdi/font/fonts/*',
      './node_modules/roboto-fontface/fonts/**/*']),
    gulp.dest('./static/fonts')
  ], cb);
});

gulp.task('sass', function(cb) {
  pump([
    gulp.src(['./sass/app.sass', './sass/bingo.sass']),
    sass({includePaths: sassPaths}),
    prefix(),
    cssmin(),
    gulp.dest('./static/css')
  ], cb);
});

gulp.task('js', function(cb) {
  var b = browserify('./js/app.js');

  pump([
    b.bundle(),
    source('app.js'),
    streamify(uglify()),
    gulp.dest('./static/js')], cb);
});

gulp.task('sass:watch', function(){
  gulp.watch('./sass/*.s?ss', ['sass'])
});

gulp.task('default', function() {
  runSequence('sass', 'fonts', 'js');
});
