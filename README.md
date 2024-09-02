# URL Shortener

A simple URL shortener service that allows you to shorten long URLs with a simple usage report.


<img width="1308" alt="Screenshot 2024-09-01 at 6 36 22 PM" src="https://github.com/user-attachments/assets/e43a6136-4cd5-42ae-904c-e43ecfb3fccb">



## Usage Report

The usage report for the URL Shortener application focuses on URLs that have been interacted with. This report includes:

- **Short URL**: The shortened version of the URL.
- **Target URL**: The original URL that was shortened.
- **Title**: The title of the target URL (if available).
- **Number of Clicks**: The count of how many times the short URL has been visited.
- **IP Address**: The visitor's IP address.
- **Geolocation**: The visitor's geolocation (if available).
- **Timestamp**: The time of the visit.

### Details

- **Relevance**: The report only includes URLs that have been visited. This approach ensures that the report is focused and provides actionable insights into which URLs are performing well.
- **Clarity**: By excluding URLs without visits, the report avoids clutter and makes it easier to interpret the data.

<img width="978" alt="Screenshot 2024-09-01 at 6 32 39 PM" src="https://github.com/user-attachments/assets/072c3a85-0357-4472-834f-c91893cad0f8">

##  Short URL Creation and Usage Reporting Workflow
<img width="450" alt="Short URL Creation and Usage Reporting Workflow" src="https://github.com/user-attachments/assets/f538e2d2-52b6-4ea4-bded-c385dba87f07">



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

   This project uses PostgreSQL as the database. Below are the instructions for setting up PostgreSQL and configuring the application to use it.
      
      I. Ensure that PostgreSQL is installed on your system. You can install it using the following methods:
   
      - **macOS**: Using Homebrew
        
        ```bash
        brew install postgresql
        brew services start postgresql
   
      II. Configure config/database.yml file to use PostgreSQL.
   
      III. Create Database
   
         rails db:create
   
      IV. Run Migrations
      
         rails db:migrate


4. **Precompile Assets**
   
   ```bash
   rake assets:precompile

5. **Start the Rails Server**
   
   ```bash
   rails server

The application will be available at http://localhost:10000.


## Testing with RSpec

1. **To run all the tests in the project**
   
   ```bash
   bundle exec rspec

This command will execute all the specs in the spec/ directory.


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
