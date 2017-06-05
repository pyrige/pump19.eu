var pump = require('pump');
var gulp = require('gulp');
var babel = require('gulp-babel');
var sass = require('gulp-sass');
var concat = require('gulp-concat');
var cssmin = require('gulp-cssmin');
var prefix = require('gulp-autoprefixer');
var uglify = require('gulp-uglify');

var runSequence = require('run-sequence');

var sassPaths = [
  'node_modules/font-awesome/scss',
  'node_modules/roboto-fontface/css/roboto/sass',
  'node_modules/roboto-fontface/css/roboto-slab/sass',
  'node_modules/foundation-sites/scss'
];

gulp.task('fonts', function(cb) {
  pump([
    gulp.src([
      './node_modules/font-awesome/fonts/fontawesome-webfont.*',
      './node_modules/roboto-fontface/fonts/**/*']),
    gulp.dest('./static/fonts')
  ], cb);
});

gulp.task('sass', function(cb) {
  pump([
    gulp.src(['./sass/app.sass', './sass/bingo.sass']),
    sass({includePaths: sassPaths}),
    prefix(),
    //cssmin(),
    gulp.dest('./static/css')
  ], cb);
});

gulp.task('js', function(cb) {
  pump([
    gulp.src([
      './node_modules/jquery/dist/jquery.slim.min.js',
      './node_modules/foundation-sites/js/foundation.core.js',
      './node_modules/foundation-sites/js/foundation.util.mediaQuery.js',
      './node_modules/foundation-sites/js/foundation.abide.js',
      './js/app.js']),
    babel({presets: ['es2015']}),
    concat('app.js'),
    uglify({}),
    gulp.dest('./static/js')
  ], cb);
});

gulp.task('sass:watch', function(){
  gulp.watch('./sass/*.s?ss', ['sass'])
});

gulp.task('default', function() {
  runSequence('sass', 'fonts', 'js');
});
