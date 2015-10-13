var gulp = require('gulp'),
    iff = require('gulp-if'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    replace = require('gulp-replace'),
    watch = require('gulp-watch'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    coffee = require('gulp-coffee'),
    shopify = require('gulp-shopify-upload'),
    config = require('./private.json');

gulp.task('default', ['build', 'watch', 'upload']);

gulp.task('build', ['styles', 'scripts']);

gulp.task('styles', function() {
  return gulp.src('./styles/app.scss')
    .pipe(sass())
    .pipe(replace(/'\{\{(.*)\}\}'/g, '{{$1}}'))
    .pipe(autoprefixer({ browsers: ['last 2 version', '> 1%'] }))
    .pipe(rename('app.css.liquid'))
    .pipe(gulp.dest('./assets'))
});

gulp.task('scripts', ['vendor', 'application'])

gulp.task('vendor', function() {
  return gulp.src([
      './node_modules/underscore/underscore.js',
      './node_modules/angular/angular.js',
      './node_modules/bootstrap-sass/assets/javascripts/bootstrap.js'
    ])
    .pipe(concat('vendor.js'))
    .pipe(gulp.dest('./assets'));
});

gulp.task('application', function() {
  return gulp.src('./scripts/**/*.coffee')
    .pipe(concat('app.coffee'))
    .pipe(coffee())
    .pipe(replace(/'\{\{(.*)\}\}'/g, '{{$1}}'))
    .pipe(concat('app.js.liquid'))
    .pipe(gulp.dest('./assets'));
});

gulp.task('watch', function() {
  gulp.watch('./styles/**/*', ['styles']);
  gulp.watch('./scripts/**/*', ['application']);
});

gulp.task('upload', function() {
  watch('./+(assets|layout|config|snippets|templates|locales)/**')
    .pipe(shopify(
      config.shopify.key,
      config.shopify.password,
      config.shopify.url,
      config.shopify.theme
    ))
});