/**
 * Material Design Password Box Input Binding for Shiny
 * @description Handles password input changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialPasswordBox extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-password-box');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-password-box', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-password-box');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialPasswordBox());
});
