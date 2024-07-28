#!/bin/bash

# Navigate to the project root (assuming the script is run from the project root)
cd "$(dirname "$0")"

# Create new directories
mkdir -p cmd/api config internal pkg scripts tests

# Create internal subdirectories
mkdir -p internal/auth internal/handlers internal/middleware internal/models internal/repository internal/services

# Create pkg subdirectories
mkdir -p pkg/database pkg/logger pkg/validator

# Only create main.go if it doesn't exist
if [ ! -f cmd/api/main.go ]; then
    cat << EOF > cmd/api/main.go
package main

import (
    "fmt"
    "log"
)

func main() {
    fmt.Println("eCommerce Backend for Smart Home Appliances")
    // TODO: Implement main logic
}
EOF
fi

# Create config file if it doesn't exist
if [ ! -f config/config.go ]; then
    cat << EOF > config/config.go
package config

type Config struct {
    // TODO: Add configuration fields
}

func LoadConfig() (*Config, error) {
    // TODO: Implement configuration loading
    return &Config{}, nil
}
EOF
fi

# Create database connection file if it doesn't exist
if [ ! -f pkg/database/postgres.go ]; then
    cat << EOF > pkg/database/postgres.go
package database

import (
    "database/sql"
    _ "github.com/lib/pq"
)

func NewPostgresConnection(connString string) (*sql.DB, error) {
    // TODO: Implement database connection
    return nil, nil
}
EOF
fi

# Append to .gitignore if it exists, create if it doesn't
if [ -f .gitignore ]; then
    cat << EOF >> .gitignore

# Additional ignores for eCommerce project
*.log
.env
.vscode/
.idea/
*.exe
*.exe~
*.dll
*.so
*.dylib
*.test
*.out
go.work
EOF
else
    cat << EOF > .gitignore
# Binaries
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with 'go test -c'
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

# Go workspace file
go.work

# Environment variables
.env

# IDE-specific files
.vscode/
.idea/

# Logs
*.log

# OS-specific files
.DS_Store
Thumbs.db
EOF
fi

# Initialize go.mod if it doesn't exist
if [ ! -f go.mod ]; then
    go mod init github.com/Mustafa-khann/EcommerceBackend
fi

# Add or update dependencies
go get -u github.com/lib/pq
go get -u github.com/gorilla/mux
go get -u github.com/joho/godotenv
go get -u golang.org/x/crypto/bcrypt

echo "eCommerce backend project structure updated successfully!"
