/**
 * Material Design Tabs for Shiny
 * @description Handles tab click events and content visibility
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  // Handle tab click events
  $(document).on('click', 'li.tab a', function() {
    $(this).trigger('shown');
  });

  // Make tab content visible
  $('.shiny-material-tab-content').css('visibility', 'visible');
});
