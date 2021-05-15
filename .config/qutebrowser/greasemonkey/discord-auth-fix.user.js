// ==UserScript==
// @name         Discord Auth Fix
// @namespace    http://istvan.donko.hu/
// @version      0.1
// @description  Fix Discord auth issue with window sizing
// @author       István Donkó (Isti115)
// @match        https://discord.com/*
// @run-at       document-start
// ==/UserScript==

;(function() {
  'use strict';

  /*
    Not needed since the following commit:
    https://github.com/qutebrowser/qutebrowser/commit/be37524f47bcb78a319eae4e1d61794dfec6cc36
  */

  // Object.defineProperty(window, 'outerWidth', { get() { return window.innerWidth; } });
  // unsafeWindow.outerWidth = unsafeWindow.innerWidth
})();
