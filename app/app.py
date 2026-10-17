import os
import threading
import time
from http.server import BaseHTTPRequestHandler, HTTPServer

NAME = os.getenv("STUDENT_NAME", "Asset")
SURNAME = os.getenv("STUDENT_SURNAME", "Kainaddinov")
GROUP = os.getenv("STUDENT_GROUP", "IT2-2306")
STUDENT_ID = os.getenv("STUDENT_ID", "37428")

BANNER = f"""================================
DevOps Student Application
================================

Name: {NAME}
Surname: {SURNAME}
Group: {GROUP}
Student ID: {STUDENT_ID}

Application is running successfully!
"""

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        body = BANNER.encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(body)
    def log_message(self, *args):
        pass

def serve():
    HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()

if __name__ == "__main__":
    print(BANNER, flush=True)
    threading.Thread(target=serve, daemon=True).start()
    n = 0
    while True:
        n += 1
        print(f"[heartbeat {n}] {NAME} {SURNAME} app is alive", flush=True)
        time.sleep(10)
