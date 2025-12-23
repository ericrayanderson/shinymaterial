/**
 * Material Design Radio Button Input Binding for Shiny
 * @description Handles radio button selection changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const EMPTY_PLACEHOLDER = '_shinymaterialradioempty_';
  const EMPTY_REGEX = new RegExp(EMPTY_PLACEHOLDER, 'g');

  class ShinyMaterialRadioButton extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-radio-button');
    }

    getValue(el) {
      const checked = $(el).find('input:checked');
      if (checked.length === 0) return null;

      const id = checked.attr('id');
      return id ? id.replace(EMPTY_REGEX, '') : null;
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-radio-button', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-radio-button');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialRadioButton());
});
