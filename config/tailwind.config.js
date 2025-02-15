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
      colors: {
        primary: colors.blue,
        secondary: colors.teal,
        neutral: colors.gray,
        youtubemusic: '#FF0000',
        spotify: '#1ED760',
        applemusic: '#FC3C44',
      },
      gridTemplateColumns: {
        'auto-fill-180': 'repeat(auto-fill, minmax(180px, 1fr))',
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
