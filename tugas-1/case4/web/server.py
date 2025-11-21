from http.server import SimpleHTTPRequestHandler, HTTPServer
import os

class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        files = os.listdir("/reports")
        files = [f"<li><a href='{f}'>{f}</a></li>" for f in files]

        html = "<h1>Weather Reports</h1><ul>" + "".join(files) + "</ul>"
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(html.encode())

HTTPServer(("", 9999), Handler).serve_forever()


