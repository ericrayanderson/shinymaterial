/**
 * Material Design Fixed Side Navigation for Shiny
 * @description Initializes fixed side navigation menu trigger
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Add sidenav trigger to navigation wrapper
  const navWrapper = document.querySelector('.nav-wrapper');
  if (navWrapper) {
    const trigger = document.createElement('a');
    trigger.href = '#';
    trigger.dataset.target = 'slide-out';
    trigger.className = 'sidenav-trigger';
    trigger.innerHTML = '<i class="material-icons">menu</i>';
    navWrapper.insertBefore(trigger, navWrapper.firstChild);
  }
});
