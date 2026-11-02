"""
Medical Expiry Tracker 3D – Local Development Server
Run this file to start the Flask application locally.

Usage:
    python run.py

Then open: http://127.0.0.1:5000
Demo credentials: admin / admin123
"""

import os
import sys
import threading
import webbrowser

# Ensure the project root is on the path
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, BASE_DIR)

# Change to project root so all relative paths resolve correctly
os.chdir(BASE_DIR)

import db
import app as flask_app

if __name__ == "__main__":
    print("=" * 60)
    print("  Medical Expiry Tracker 3D – Starting Server")
    print("=" * 60)

    # Initialize (or migrate) the local SQLite database
    print("[DB] Initialising database ...")
    db.init_db()
    print("[DB] Database ready.")

    print()
    print("  Server URL  : http://127.0.0.1:5000")
    print("  Login creds : admin / admin123")
    print()
    print("  Press Ctrl+C to stop the server.")
    print("=" * 60)

    # Automatically open the browser to the application
    def _open_browser():
        webbrowser.open_new("http://127.0.0.1:5000")

    if os.environ.get("WERKZEUG_RUN_MAIN") == "true":
        threading.Timer(1.2, _open_browser).start()

    flask_app.app.run(
        debug=True,
        host="127.0.0.1",
        port=5000,
        use_reloader=True,
    )
