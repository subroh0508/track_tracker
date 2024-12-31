const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/frontend/**/*.{rb,erb}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: colors.blue,
        secondary: colors.amber,
        neutral: colors.gray,
        youtubemusic: '#FF0000',
        spotify: '#1ED760',
        applemusic: '#FC3C44',
      },
      gridTemplateColumns: {
        'auto-fit-200': 'repeat(auto-fit, minmax(200px, 1fr))',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  darkMode: 'class',
}
