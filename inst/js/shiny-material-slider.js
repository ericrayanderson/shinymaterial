/**
 * Material Design Slider Input Binding for Shiny
 * @description Handles slider value changes
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  class ShinyMaterialSlider extends Shiny.InputBinding {
    find(scope) {
      return $(scope).find('.shiny-material-slider');
    }

    getValue(el) {
      const $el = $(el);
      const classValue = $el.find('.value').html();

      if (classValue && classValue.length > 0) {
        return Number(classValue);
      }

      const inputValue = $el.find('input').val();
      return Number(inputValue);
    }

    subscribe(el, callback) {
      $(el).on('change.shiny-material-slider', () => callback());
    }

    unsubscribe(el) {
      $(el).off('.shiny-material-slider');
    }
  }

  Shiny.inputBindings.register(new ShinyMaterialSlider());
});
