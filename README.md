# Media Inventory App

This is a Media Inventory Application built with Ruby on Rails. It allows users to track Comics, TV Shows, Wrestling Events, Movies, and Albums.

## Getting Started

### Prerequisites

*   Ruby 3.2.3
*   Rails 7.1.3
*   Bundler

### Installation

1.  Clone the repository:
    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  Install dependencies:
    ```bash
    bundle install
    ```

3.  Set up the database:
    ```bash
    rails db:migrate
    rails db:seed
    ```
    The seed command creates two default users:
    *   Admin: `admin@example.com` / `password`
    *   User: `user@example.com` / `password`

### Running the Application

Start the Rails server:
```bash
rails server
```

Visit `http://localhost:3000` in your browser.

### Running Tests

To run the test suite:
```bash
bundle exec rspec
```

## Features

*   User Authentication (Login/Logout)
*   Manage various media types:
    *   Comics
    *   TV Shows
    *   Wrestling Events
    *   Movies
    *   Albums
*   User Profile Management
