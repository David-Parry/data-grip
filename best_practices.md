# SQL Best Practices

1. **Ensure SQL operations are idempotent** - Write SQL statements that can be executed multiple times safely without causing unintended side effects. Use conditional checks like `IF NOT EXISTS` for CREATE statements and `WHERE` clauses for UPDATE/DELETE operations.

2. **Use parameterized queries** - Always use prepared statements or parameterized queries to prevent SQL injection vulnerabilities. Never concatenate user input directly into SQL strings.

3. **Implement proper error handling** - Wrap database operations in try-catch blocks with appropriate logging and rollback mechanisms for transactions.

4. **Add defensive null checks** - Check for null values before performing database operations, especially when dealing with optional parameters or user input.

5. **Use transactions appropriately** - Group related database operations within transactions and ensure proper commit/rollback handling.

6. **Validate data types and constraints** - Ensure data types match expected formats and validate constraints before executing SQL operations.

7. **Implement connection pooling** - Use connection pooling to manage database connections efficiently and avoid connection leaks.

8. **Add proper indexing considerations** - Consider the impact of queries on existing indexes and suggest appropriate indexing for new queries.

9. **Use consistent naming conventions** - Follow consistent naming patterns for tables, columns, and database objects throughout the codebase.

10. **Log database operations appropriately** - Include meaningful logging for database operations, especially for data modifications, with appropriate log levels.
