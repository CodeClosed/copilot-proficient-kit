import { CopilotClient, approveAll, defineTool } from "@github/copilot-sdk";
import { pathToFileURL } from "node:url";

/**
 * Demonstrates using the official @github/copilot-sdk to:
 * 1. Start the Copilot runtime and list available AI models
 * 2. Register a custom SDK tool
 * 3. Run multi-model agentic sessions
 */
export async function runCopilotSdkDemo(prompt = "Reply with a one-sentence tip on writing maintainable code.") {
  const client = new CopilotClient({
    useLoggedInUser: true,
  });

  await client.start();

  try {
    const models = await client.listModels();
    console.log(`Discovered ${models.length} Copilot models.`);

    const repoInfoTool = defineTool("get_project_metadata", {
      description: "Returns metadata about the current project",
      parameters: { type: "object", properties: {} },
      handler: async () => JSON.stringify({
        project: "copilot-proficient-kit",
        features: ["custom-instructions", "prompts", "agents", "skills", "mcp", "copilot-sdk"]
      }),
    });

    const session = await client.createSession({
      onPermissionRequest: approveAll,
      enableSessionTelemetry: true,
      interactiveUser: true,
      refreshCustomInstructions: true,
      tools: [repoInfoTool],
    });

    const response = await session.sendAndWait({
      prompt,
    }, 60000);

    const text = response?.data?.content ?? "";
    await session.disconnect();
    return text;
  } finally {
    await client.stop();
  }
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  const reply = await runCopilotSdkDemo(
    "Call the get_project_metadata tool and summarize the enabled Copilot features in one sentence."
  );
  console.log("Copilot SDK Response:\n", reply);
}
