// import path from 'path'
// import puppeteer from 'puppeteer'
import inspector from 'inspector'
import { onProcessDeath } from '@/utils'

export default async (inspectorPort, inspectorHost) => {
    inspector.open(inspectorPort, inspectorHost)
    onProcessDeath(inspector.close)
    // console.log('inspector:', inspector)

    // const inspectorUrl: any = inspector.url()
    // const devtoolsUrl = `devtools://devtools/bundled/inspector.html?v8only=true&${inspectorUrl.replace(
    //     '://',
    //     '='
    // )}`
    // const browser = await puppeteer.launch({
    //     userDataDir: path.join(process.cwd(), '.dump/puppeteerSession'),
    //     devtools: false,
    //     // args: [
    //     //     'disable-infobars',
    //     //     'disable-popup-blocking',
    //     //     'disable-notifications',
    //     // ],
    //     // prefs: {
    //     //     'profile.default_content_settings.popups': 2,
    //     //     'profile.default_content_settings.notifications': 2,
    //     // },
    //     // args: ['--window-size=1920,1080', '--remote-debugging-port=9222'],
    //     ignoreDefaultArgs: ['--enable-automation'],
    //     // defaultViewport: {
    //     //     width: 1920,
    //     //     height: 1080,
    //     // },
    //     defaultViewport: null,
    //     headless: false,
    // })
    // onProcessDeath(browser.close)
    // // const page = await browser.newPage()
    // const pages = await browser.pages()
    // const page = pages[0]
    // // const devtoolsUrl = `devtools://devtools/bundled/inspector.html?experiments=true&v8only=true&${inspector.url()}`

    // await page.goto(devtoolsUrl)
    // const test3 = await page.evaluate(async () => {
    //     return { test: 123, test2: window.document }
    // })
    // console.log('test:', test3)

    // // await browser.close()
}
