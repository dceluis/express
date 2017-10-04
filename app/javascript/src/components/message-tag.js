import {Element as PolymerElement} from '@polymer/polymer/polymer-element.js';

// Added "export" to export the MyApp symbol from the module
export class MessageTag extends PolymerElement {

  // Define a string template instead of a `<template>` element.
  static get template() {
    return `<span>[[count]]</span>`
  }

  constructor() {
    super();
  }

  // properties, observers, etc. are identical to 2.x
  static get properties() {
    return {
      count: {
        Type: String,
        reflectToAttribute: true
      }
    }
  }
}

customElements.define('message-tag', MessageTag);
