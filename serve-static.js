// Minimal static file server for local preview on Node v10
// Serves the current workspace directory at http://localhost:8000

const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

const port = process.env.PORT ? Number(process.env.PORT) : 8000;
const rootDir = path.resolve(__dirname);

const contentTypes = {
  '.html': 'text/html; charset=UTF-8',
  '.htm': 'text/html; charset=UTF-8',
  '.css': 'text/css; charset=UTF-8',
  '.js': 'application/javascript; charset=UTF-8',
  '.mjs': 'application/javascript; charset=UTF-8',
  '.json': 'application/json; charset=UTF-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.webp': 'image/webp',
  '.ico': 'image/x-icon',
  '.txt': 'text/plain; charset=UTF-8',
  '.map': 'application/octet-stream',
};

function send(res, code, body, headers) {
  res.writeHead(code, Object.assign({ 'Cache-Control': 'no-cache' }, headers));
  res.end(body);
}

function safeJoin(base, target) {
  const targetPath = path.posix.normalize(target); // forward slashes
  const resolved = path.resolve(base, targetPath.replace(/^\/+/, ''));
  if (!resolved.startsWith(base)) {
    return null; // attempted path traversal
  }
  return resolved;
}

const server = http.createServer((req, res) => {
  try {
    const parsed = url.parse(req.url || '/');
    let pathname = decodeURIComponent(parsed.pathname || '/');

    // Default to site index when root requested
    if (pathname === '/' || pathname === '') {
      pathname = '/site/index.html';
    }

    const fsPath = safeJoin(rootDir, pathname);
    if (!fsPath) {
      return send(res, 400, 'Bad Request');
    }

    fs.stat(fsPath, (err, stats) => {
      if (err) {
        return send(res, 404, 'Not Found');
      }

      let filePath = fsPath;
      if (stats.isDirectory()) {
        filePath = path.join(fsPath, 'index.html');
      }

      fs.readFile(filePath, (readErr, data) => {
        if (readErr) {
          return send(res, 404, 'Not Found');
        }
        const ext = path.extname(filePath).toLowerCase();
        const type = contentTypes[ext] || 'application/octet-stream';
        send(res, 200, data, { 'Content-Type': type });
      });
    });
  } catch (e) {
    send(res, 500, 'Internal Server Error');
  }
});

server.listen(port, '127.0.0.1', () => {
  // eslint-disable-next-line no-console
  console.log(`Static server running at http://127.0.0.1:${port}/`);
});


