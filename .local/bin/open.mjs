#!/usr/bin/env node

// const exec = require('child_process').exec
import { exec } from 'child_process'

const file = process.argv[2]

const associations = [
  { filter: /.*\.(png|jpg)$/, command: ['vimiv'] },
  { filter: /.*\.pdf$/, command: ['zathura'] },
  { filter: /.*\.(mp3|mp4)$/, command: ['mpv', '--force-window'] },
  { filter: /.*\.svg$/, command: ['inkscape'] },
  { filter: /.*\.doc$/, command: ['libreoffice'] }
]

for (let { filter, command } of associations) {
  if (filter.test(file)) {
    exec(`${command} "${file}"`)
  }
}
