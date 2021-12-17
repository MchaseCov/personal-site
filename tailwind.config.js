module.exports = {
  mode: 'jit',
  plugins: [
    require('daisyui'),
  ],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ]
}
