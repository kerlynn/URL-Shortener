/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
    "./app/stylesheets/**/*.css",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
  safelist: [
    "pagy-nav",
    "pagination",
    "page",
    "prev",
    "next",
    "disabled",
    "active",
  ],
};
