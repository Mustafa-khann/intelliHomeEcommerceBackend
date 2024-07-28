package database

import (
    "database/sql"
    _ "github.com/lib/pq"
)

func NewPostgresConnection(connString string) (*sql.DB, error) {
    // TODO: Implement database connection
    return nil, nil
}
