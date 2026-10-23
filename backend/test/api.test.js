
const test = require("node:test");
const assert = require("node:assert/strict");
const app = require("../app");

test("health endpoint returns healthy status", async () => {
  const server = app.listen(0, "127.0.0.1");

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
    await new Promise((resolve, reject) =>
      server.close(err => err ? reject(err) : resolve())
    );
  }
});

test("message endpoint returns expected response", async () => {
  const server = app.listen(0, "127.0.0.1");

  try {
    const address = server.address();
    const response = await fetch(
      `http://127.0.0.1:${address.port}/api/message`
    );
    const body = await response.json();

    assert.equal(response.status, 200);
    assert.equal(body.status, "success");
  } finally {
    await new Promise((resolve, reject) =>
      server.close(err => err ? reject(err) : resolve())
    );
  }
});
