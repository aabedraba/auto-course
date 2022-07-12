console.log("Starting...");
const claatAuthToken = Deno.env.get("CLAAT_AUTH_TOKEN");

if (claatAuthToken === undefined || claatAuthToken === "") {
  throw new Error("OAuth token needs to be provided");
}

console.log("env loaded...", claatAuthToken);

const p = Deno.run({
  cmd: [
    "claat",
    "export",
    "-auth",
    claatAuthToken,
    "1Kmo2-kbpEGaQgPURbtOC5gXmU8gHSian2ACKumYUEj8",
  ],
});

const status = await p.status();

console.log(status);
