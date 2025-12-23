/**
 * Material Design Page Initialization for Shiny
 * @description Auto-initializes all Material Design components
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Initialize all Material Design components
  if (typeof M !== 'undefined' && M.AutoInit) {
    M.AutoInit();
  }
});
