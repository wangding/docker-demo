const http = require('http');
const cp   = require('child_process');

http.createServer((req, res) => {
  let prc = cp.exec('./deploy.sh', ()=>{});
  prc.stdout.pipe(process.stdout);
  prc.stderr.pipe(process.stderr);

  res.end('i am deploy server!');
}).listen(8080);
