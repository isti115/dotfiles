#!/usr/bin/env -S deno -q run --allow-run

const file = Deno.args[0]

const associations = [
  { filter: /.*\.(png|jpg)$/, command: ['vimiv'] },
  { filter: /.*\.pdf$/, command: ['zathura'] },
  { filter: /.*\.(mp3|mp4)$/, command: ['mpv', '--force-window'] },
  { filter: /.*\.svg$/, command: ['inkscape'] },
  { filter: /.*\.doc$/, command: ['libreoffice'] }
]

for (let { filter, command } of associations) {
  if (filter.test(file)) {
    await Deno.run({ cmd: [...command, file] }).status()
  }
}
