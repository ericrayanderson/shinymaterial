/**
 * Material Design Modal Initialization for Shiny
 * @description Initializes modal dialogs with Material Design styling
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Initialize Material modals
  $('.modal').modal({
    dismissible: false
  });

  // Handle modal trigger events
  $(document).on('click', '.shiny-material-modal-trigger', function() {
    $(this).trigger('shown');
  });
});
