/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import { InteriorLeftNav } from 'carbon-components'
import { DataTable } from 'carbon-components'
import { DetailPageHeader } from 'carbon-components'
import { FileUploader } from 'carbon-components'
import { OverflowMenu } from 'carbon-components'

document.addEventListener('turbolinks:load', function () {
  InteriorLeftNav.init();
  DataTable.init();
  DetailPageHeader.init();
  FileUploader.init();
  OverflowMenu.init();
});
