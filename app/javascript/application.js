// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("jquery")
global.$ = jQuery;
//= require jquery
//= require jquery_ujs
import  jQuery  from "jquery"
let $ = window.$ = window.jQuery = jQuery
window.jQuery = $;
window.$ = $;
import * as jq from 'jquery';
window.importmapScriptsLoaded = true;
import "popper"
import "bootstrap"
