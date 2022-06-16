import usePuppeteerChromeInspector from '@/utils/usePuppeteerChromeInspector'
if (
    process.env.IS_DEVELOPMENT === 'true' ||
    process.env.NODE_ENV === 'development'
) {
    const { APP_DEVTOOLS_PORT, APP_DEVTOOLS_HOST } = process.env
    usePuppeteerChromeInspector(APP_DEVTOOLS_PORT, APP_DEVTOOLS_HOST)
}
import '@/utils/requireTsFiles'
import useHotModuleReplacement from '@/utils/useHotModuleReplacement'
useHotModuleReplacement({
    // ignore: /node_modules/,
    ignore: path => {
        const isNodeModule = path.includes('node_modules')
        if (isNodeModule) {
            return true
        }
    },
})

// console.log('process.env:', process.env)

import './main'
module.hot?.accept('./main', () => {
    console.log(
        `%c main module перезагружен`,
        'background: #222; color: #bada55; font-size: 18px'
    )
})
