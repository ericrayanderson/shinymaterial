/**
 * Material Design File Input Binding for Shiny
 * @description Handles file input changes with FileReader support
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialFileInput extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-file-input');
    }

    getValue(el) {
      const file = el.files[0];
      if (!file) return null;

      // Return file metadata for Shiny to process
      return {
        name: file.name,
        size: file.size,
        type: file.type
      };
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-file-input', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-file-input');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialFileInput());
});
