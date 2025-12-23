/**
 * Material Design Checkbox Input Binding for Shiny
 * @description Handles checkbox state changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialCheckbox extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-checkbox');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-checkbox', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-checkbox');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialCheckbox());
});
