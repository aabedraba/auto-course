const p = Deno.run({
  cmd: ["claat", "export", "1Kmo2-kbpEGaQgPURbtOC5gXmU8gHSian2ACKumYUEj8"],
});

const status = await p.status();

console.log(status);
