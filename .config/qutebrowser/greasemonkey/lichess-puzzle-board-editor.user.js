// ==UserScript==
// @name         Lichess Puzzle Board Editor
// @namespace    http://istvan.donko.hu/
// @version      0.1
// @description  Open Lichess puzzles in board editor
// @author       István Donkó (Isti115)
// @match        https://lichess.org/*
// ==/UserScript==

const makeEmptyBoard = () => (
  Array.from({length:8}, () => (
    Array.from({length:8}, () => ' ')
  ))
)

const getLetter = p => {
  const letter = p.classList[1] === 'knight' ? 'n' : p.classList[1][0]
  return p.classList[0] === 'white' ? letter.toUpperCase() : letter
}

const getTransform = t => {
  const m = t.match(/translate\((.*)px, (.*)px\)/)
  return { x: Number(m[1]), y: Number(m[2]) }
}

const getPiece = p => {
  const t = getTransform(p.style.transform)
  return { x: t.x / p.clientWidth, y: t.y / p.clientHeight, l: getLetter(p) }
}

const getFEN = () => {
  const board = makeEmptyBoard()
  const pieces = [...document.querySelectorAll(
    // ':not(.no-square) > piece:not(.ghost)'
    '.manipulable piece:not(.ghost)'
  )].map(getPiece).forEach(p => board[p.y][p.x] = p.l)
  return board.map(r => r.join('')).join('/').replace(/ +/g, s => s.length)
}

;(function() {
  'use strict';

  const input = document.createElement('input')
  input.type = 'button'
  input.value = 'Board Editor'
  input.addEventListener('click', () => {
    window.open(`https://lichess.org/editor/${getFEN()}_w_-_-_0_1`)
  })

  const buttons = document.querySelector('.site-buttons')
  buttons.insertBefore(input, buttons.firstChild)
})();
