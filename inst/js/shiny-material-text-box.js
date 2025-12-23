/**
 * Material Design Text Box Input Binding for Shiny
 * @description Handles text input changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialTextBox extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-text-box');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-text-box', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-text-box');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialTextBox());
});
