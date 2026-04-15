# SmartEduTrack
SmartEduTrack is a Flask-based attendance system with dynamic QR codes, role-based dashboards, and classroom geofence verification.

## PostgreSQL setup

1. Create a local PostgreSQL database named `smartedutrack`.

   ```powershell
   & "C:\Program Files\PostgreSQL\18\bin\createdb.exe" -U postgres smartedutrack
   ```

2. Set the database URL for the current PowerShell session.

   ```powershell
   $env:DATABASE_URL="postgresql+psycopg://postgres:YOUR_PASSWORD@localhost:5432/smartedutrack"
   ```

3. Run the app.

   ```powershell
   python app.py
   ```

The app keeps a SQLite fallback for quick local testing when `DATABASE_URL` is not set.

## Render deployment

If you deploy on Render, do not rely on `.env` from your local machine. The `.env` file is ignored by git and is not available in the Render container.

Set these values in the Render service environment settings:

```text
SECRET_KEY=your-production-secret
DATABASE_URL=your-render-postgresql-connection-string
```

Notes:

1. The app accepts Render PostgreSQL URLs in `postgres://`, `postgresql://`, and `postgresql+psycopg://` form.
2. If `DATABASE_URL` is missing on Render, the app now fails fast instead of silently falling back to SQLite.
3. If you want to inspect deployed signup data in pgAdmin, pgAdmin must be connected to the same Render PostgreSQL database, not your local PostgreSQL server.
