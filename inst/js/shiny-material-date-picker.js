/**
 * Material Design Date Picker Input Binding for Shiny
 * @description Handles date picker initialization and value changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Initialize Material date pickers
  const initDatePickers = () => {
    $('.datepicker').datepicker({});
  };

  initDatePickers();

  class ShinyMaterialDatePicker extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-date-picker');
    }

    getValue(el) {
      return $(el).val();
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-date-picker', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-date-picker');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialDatePicker());
});
