/**
 * Material Design Side Navigation Tabs for Shiny
 * @description Handles side navigation tab state and synchronization
 */
'use strict';

document.addEventListener('DOMContentLoaded', () => {
  const $tabs = $('.shiny-material-side-nav-tab');

  if ($tabs.length === 0) return;

  // Activate first tab
  $tabs.first().addClass('active');

  const firstTabId = $tabs.first().attr('id');
  const firstTabContentId = firstTabId.replace('_tab_id', '');
  const firstContentFound = $('.shiny-material-side-nav-tab-content').first().attr('id');

  // Validate tab order
  if (firstTabContentId !== firstContentFound) {
    console.error(
      `SHINYMATERIAL ERROR [side-nav tabs]: Tab content order mismatch.\n` +
      `First tab (${firstTabContentId}) does not match first tab content (${firstContentFound}).\n` +
      `Please rearrange the UI code.`
    );
    document.body.innerHTML = '';
    return;
  }

  // Wait for Shiny to initialize
  $(document).on('shiny:sessioninitialized', () => {
    /**
     * Collect and report tab state information
     */
    const getSideNavTabsInfo = () => {
      const tabsInfo = [];

      $tabs.each((index, tab) => {
        tabsInfo.push({
          id: tab.id.slice(0, -7),
          active: $(tab).hasClass('active')
        });
      });

      Shiny.setInputValue('side_nav_tab_info', JSON.stringify(tabsInfo));
    };

    getSideNavTabsInfo();

    // Update tab info on click
    $('#side_nav_tabs_click_info').on('click', getSideNavTabsInfo);
  });

  // Trigger click on first tab
  $(`#${firstTabId}`).children('a').trigger('click');
});
