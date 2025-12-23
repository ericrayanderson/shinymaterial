/**
 * Material Design Number Box Input Binding for Shiny
 * @description Handles numeric input changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialNumberBox extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-number-box');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-number-box', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-number-box');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialNumberBox());
});
