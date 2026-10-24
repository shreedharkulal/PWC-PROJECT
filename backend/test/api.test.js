const test = require("node:test");
const assert = require("node:assert/strict");
const { once } = require("node:events");
const app = require("../app");

const startServer = async () => {
  const server = app.listen(0, "127.0.0.1");
  await once(server, "listening");
  return server;
};

const stopServer = async (server) => {
  if (!server.listening) return;

  await new Promise((resolve, reject) => {
    server.close((err) => (err ? reject(err) : resolve()));
  });
};

test("health endpoint returns healthy status", async () => {
  const server = await startServer();

  try {
    const address = server.address();
    const response = await fetch(
      `http://127.0.0.1:${address.port}/api/health`
    );

    assert.equal(response.status, 200);
    assert.deepEqual(await response.json(), {
      status: "healthy"
    });
  } finally {
    await stopServer(server);
  }
});

test("message endpoint returns expected response", async () => {
  const server = await startServer();

  try {
    const address = server.address();
    const response = await fetch(
      `http://127.0.0.1:${address.port}/api/message`
    );
    const body = await response.json();

    assert.equal(response.status, 200);
    assert.equal(body.status, "success");
  } finally {
    await stopServer(server);
  }
});
