#!/usr/bin/env node

const http = require('http');

http.createServer((req, res) => {
    res.end('Hello');
}).listen(8080);
