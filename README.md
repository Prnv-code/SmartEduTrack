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
