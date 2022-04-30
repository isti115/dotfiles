#!/usr/bin/env -S deno -q run --allow-run

console.log(Deno.args)

const lsblk = Deno.run({
  cmd: [ "lsblk", "-p", "--json", '-o', 'PATH,SIZE,FSTYPE,LABEL' ],
  stdout: "piped",
})

const devices =
  JSON.parse(
    new TextDecoder().decode(
      await lsblk.output()
    )
  ).blockdevices
// const devices = [].concat(...blk.blockdevices.map(d => d.path))

const fuzzel = Deno.run({
  cmd: [ "fuzzel", "-w", "60", "--dmenu", "--index" ],
  stdin: "piped",
  stdout: "piped",
})

await fuzzel.stdin.write(new TextEncoder().encode(
  devices.map(d => `${d.path} | ${d.size} | ${d.fstype} | ${d.label}`).join('\n')
))
await fuzzel.stdin.close()
const choice = Number(new TextDecoder().decode(await fuzzel.output()))

console.log(devices[choice].path)

const mnt = Deno.run({
  cmd: [
    "udisksctl",
    Deno.args[0] === '--un' ? 'unmount' : 'mount',
    "-b", devices[choice].path
  ],
})

await mnt.status()
