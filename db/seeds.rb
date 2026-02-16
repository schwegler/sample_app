User.create!(name:  "Admin User",
             email: "admin@example.com",
             password:              "password",
             admin:     true)

User.create!(name:  "Example User",
             email: "user@example.com",
             password:              "password",
             admin:     false)
