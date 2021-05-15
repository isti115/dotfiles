// ==UserScript==
// @name         BE-AD FuncLang evaluator
// @namespace    http://istvan.donko.hu/
// @version      0.6
// @description  Buttons for 0, 1 and 2 points, auxiliary styling
// @author       István Donkó (Isti115)
// @match        https://bead.inf.elte.hu/*
// @grant        GM_addStyle
// ==/UserScript==

const addStyle = () => {
  GM_addStyle(`
    .glyphicon-ok-circle { color: green !important; }
    .glyphicon-remove-circle { color: red !important; }

    span[title="0"] { background-color: red; }
    span[title="1"] { background-color: blue; }
    span[title="2"] { background-color: green; }
    span[title="4"] { background-color: orange; }

    input[type="button"][value="0"] { background-color: red; color: white; }
    input[type="button"][value="1"] { background-color: blue; color: white; }
    input[type="button"][value="2"] { background-color: green; color: white; }
    input[type="button"][value="4"] { background-color: orange; color: white; }

    .score-cell {
      background: linear-gradient(
        to right,
        lightgray var(--progress),
        white var(--progress),
        white 100%
      );
    }

    tr.done {
      opacity: 0.25;
    }
  `)
}

const addButtons = () => {
  const evaluationField = document.getElementById('evaluation-freeformat-text')
  const submitButton = document.querySelector('[name="save-eval-submit"]')

  ;[0, 1, 2, 4].forEach(x => {
    const numberInput = document.createElement('input')
    numberInput.type = 'button'
    numberInput.value = x
    numberInput.addEventListener('mousedown', e => {
      evaluationField.value = x
      if (e.button === 1) { submitButton.click() }
    })
    evaluationField.parentElement.appendChild(numberInput)
  })
}

const fixTitle = () => {
  const name = document.body.innerText.match(/(?<=Student:)(.*)/)[0]
  document.title = document.title.replace('Assignment Management System', name)

  if (document.querySelectorAll('.glyphicon-remove-circle').length === 1) {
    document.title += ' - ❌'
  } else if (document.querySelectorAll('.glyphicon-ok-circle').length === 1) {
    document.title += ' - ✔️'
  }
}

const openLinks = () => {
  const links = document.getElementsByTagName('a')
  ;[...links].forEach(l => {
      if (["Megtekintés", "See More"].includes(l.innerText)) { l.click() }
  })
}

const goal = 13

const sumPoints = () => {
  const tableHeaders = [...document.querySelectorAll('form th:first-child')]
  tableHeaders.forEach(th => {
    const newTh = document.createElement('th')
    const text = document.createTextNode('Score')
    newTh.appendChild(text)
    th.parentNode.insertBefore(newTh, th)
  })

  const tableBodies = tableHeaders.map(c => c.parentNode.parentNode)

  tableBodies.forEach(tbody => {
    const [header, ...rows] = [...tbody.children]

    rows.forEach(tr => {
      const score = [...tr.children].map(
        c => Number(c.innerText)
      ).filter(x => x).reduce((a, b) => a + b, 0)

      const scoreCell = document.createElement('td')
      scoreCell.classList.add('score-cell')
      scoreCell.style.setProperty('--progress', `${(score / goal) * 100}%`)
      const text = document.createTextNode(score)
      scoreCell.appendChild(text)

      if (score >= goal) {
        tr.classList.add('done')
      }

      tr.insertBefore(scoreCell, tr.children[0])
    })
  })
}

const mkLog = message => () => console.log(message)

;(function() {
  'use strict';

  ;[
    {
      match: url => true,
      actions: [addStyle]
    },
    {
      match: url => url.includes('group-overview'),
      actions: [mkLog('group-overview'), sumPoints]
    },
    {
      match: url => url.includes('evaluation'),
      actions: [mkLog('evaluation'), addButtons, fixTitle, openLinks]
    },
    {
      match: url => false,
      actions: []
    },
  ].forEach(({match, actions}) => {
    if (match(document.location.href)) {
      actions.forEach(a => a())
    }
  })
})();
