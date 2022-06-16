import jsdom from 'jsdom'
const { JSDOM } = jsdom
const dom = new JSDOM(`<!DOCTYPE html><html><body></body></html>`)
const domWindow: any = dom.window
const domDocument = domWindow._document
const originalProto = global.__proto__
Object.assign(domWindow, originalProto)
domWindow.__proto__.window = domWindow
domWindow.__proto__.document = domDocument
global.__proto__ = domWindow
export * from 'vue'
