import test from "node:test";
import assert from "node:assert/strict";
import { runCopilotSdkDemo } from "../src/copilot-api-demo.mjs";

test("should export runCopilotSdkDemo function", () => {
  assert.equal(typeof runCopilotSdkDemo, "function");
});
