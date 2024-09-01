# URL Shortener

A simple URL shortener service that allows you to shorten long URLs and track click metrics.

## Installation Guide

### Prerequisites

Before you begin, ensure you have the following installed:
- Ruby (version 3.2.2)
- Rails (version 7.1.2)
- Node.js (version 10.x or higher)

### Steps to Install

1. **Clone the Repository**
   ```bash
   git clone https://github.com/kerlynn/URL-Shortener.git
   cd url-shortener

2. **Install Ruby Gems**
   ```bash
   bundle install

3. **Setup Database**
   ```bash
   rails db:create
   rails db:migrate

   Precompile Assets

4. **Precompile Assets**
   ```bash
   rake assets:precompile

4. **Start the Rails Server**
   ```bash
   rails server

The application will be available at http://localhost:10000.


## Dependencies

This project uses the following Ruby gems:

### Core Gems

- **rails**: ~> 7.1.2  
  Ruby on Rails framework for building web applications.
- **sassc-rails**  
  For using SCSS in stylesheets.
- **pg**  
  PostgreSQL database adapter.
- **jquery-rails**  
  For integrating jQuery JavaScript library.
- **turbolinks**  
  Makes following links in your web application faster.
- **jbuilder**  
  For building JSON APIs.
- **puma**: ~> 5.0  
  Web server for Ruby/Rails applications.
- **tailwindcss-rails**: ~> 2.2.1  
  For integrating Tailwind CSS.
- **font-awesome-sass**  
  For integrating Font Awesome icons.
- **dotenv-rails**: ~> 2.8.1  
  For managing environment variables.
- **pagy**: ~> 9.0  
  For pagination.
- **geocoder**  
  For geocoding IP addresses.

### Development and Testing Gems

- **rubocop**  
  Ruby code linting.
- **pry**  
  Interactive debugging.
- **rspec-rails**  
  Testing framework for Rails applications.
- **factory_bot_rails**  
  For setting up test data.
- **rails-controller-testing**  
  Additional controller testing methods.
- **webmock**  
  For stubbing HTTP requests in tests.

### Development Tools

- **web-console**  
  For debugging in the browser.
- **spring**  
  Speeds up Rails development by keeping the application running in the background.

## Deployed Application URL

The deployed application can be accessed at: [https://url-shortener-6q15.onrender.com/](https://https://url-shortener-6q15.onrender.com/)

Thank you.
