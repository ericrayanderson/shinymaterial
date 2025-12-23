/**
 * Material Design Floating Button Input Binding for Shiny
 * @description Handles floating action button click events
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Handle floating button click events
  document.querySelectorAll('.shiny-material-floating-button').forEach((button) => {
    button.addEventListener('click', function() {
      const currentValue = parseInt(this.value, 10) || 0;
      this.value = currentValue + 1;
      this.dispatchEvent(new Event('change', { bubbles: true }));
    });
  });

  class ShinyMaterialFloatingButton extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-floating-button');
    }

    getValue(el) {
      return parseInt(el.value, 10) || 0;
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-floating-button', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-floating-button');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialFloatingButton());
});
