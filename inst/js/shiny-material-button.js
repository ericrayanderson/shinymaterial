/**
 * Material Design Button Input Binding for Shiny
 * @description Handles button click events and value updates
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Handle button click events
  document.querySelectorAll('.shiny-material-button').forEach((button) => {
    button.addEventListener('click', function() {
      const currentValue = parseInt(this.value, 10) || 0;
      this.value = currentValue + 1;
      this.dispatchEvent(new Event('change', { bubbles: true }));
    });
  });

  // Define the Shiny input binding using ES6 class syntax
  class ShinyMaterialButton extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-button');
    }

    getValue(el) {
      return parseInt(el.value, 10) || 0;
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-button', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-button');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialButton());
});
