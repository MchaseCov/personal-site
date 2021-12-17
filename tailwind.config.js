module.exports = {
  mode: 'jit',
  plugins: [
    require('daisyui'),
  ],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        'open-sans': ['"Open Sans"'],
        'josefin': ['"Josefin Sans"']
      }
    }
  },
  daisyui: {
    themes: [
      {
        'personaltheme': {
          'primary': '#f44f54', /* Red */
          'primary-focus': '#C10B29',
          'primary-content': '#F2F4F2',
          'secondary': '#E59461', /* Orange */
          'secondary-focus': '#dd702c',
          'secondary-content': '#F2F4F2',
          'accent': '#a4dbdf', /* Blue */
          'accent-focus': '#79CAD0',
          'accent-content': '#F2F4F2',
          'neutral': '#312c31', /* Neutrals */
          'neutral-focus': '#e9ece9',
          'neutral-content': '#F2F4F2',
          'base-100': '#F2F4F2',
          'base-200': '#e9ece9',
          'base-300': '#dee3de',
          'base-content': '#312c31',
          'info': '#2094f3',
          'success': '#009485',
          'warning': '#ff9900',
          'error': '#ff5724',
        },
      },
      {
        'personaldark': {
          'primary': '#f44f54', /* Red */
          'primary-focus': '#C10B29',
          'primary-content': '#312c31',
          'secondary': '#E59461', /* Orange */
          'secondary-focus': '#dd702c',
          'secondary-content': '#312c31',
          'accent': '#79CAD0', /* Blue */
          'accent-focus': '#55bcc3',
          'accent-content': '#312c31',
          'neutral': '#F2F4F2', /* Neutrals */
          'neutral-focus': '#201d20',
          'neutral-content': '#312c31',
          'base-100': '#312c31',
          'base-200': '#201d20',
          'base-300': '#151315',
          'base-content': '#F2F4F2',
          'info': '#2094f3',
          'success': '#009485',
          'warning': '#ff9900',
          'error': '#ff5724',
        },
      },
    ],
  },
}