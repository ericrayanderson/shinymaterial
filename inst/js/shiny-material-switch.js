/**
 * Material Design Switch Input Binding for Shiny
 * @description Handles switch toggle state changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialSwitch extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-switch');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-switch', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-switch');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialSwitch());
});
