/**
 * Material Design Dropdown Input Binding for Shiny
 * @description Handles dropdown select changes with space replacement handling
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const SPACE_PLACEHOLDER = '_shinymaterialdropdownspace_';
  const SPACE_REGEX = new RegExp(SPACE_PLACEHOLDER, 'g');

  /**
   * Replace space placeholders in a value
   * @param {string|string[]} value - The value to process
   * @returns {string|string[]} - Processed value
   */
  const replaceSpacePlaceholder = (value) => {
    if (value === null) return null;

    if (typeof value === 'string') {
      return value.replace(SPACE_REGEX, ' ');
    }

    if (Array.isArray(value)) {
      return value.map((item) =>
        typeof item === 'string' ? item.replace(SPACE_REGEX, ' ') : item
      );
    }

    return value;
  };

  // Initialize Material dropdowns
  const initDropdowns = () => {
    $('.shiny-material-dropdown').formSelect();
  };

  initDropdowns();

  class ShinyMaterialDropdown extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('select.shiny-material-dropdown');
    }

    getValue(el) {
      const value = $(el).val();
      return replaceSpacePlaceholder(value);
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-dropdown', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-dropdown');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialDropdown());
});
