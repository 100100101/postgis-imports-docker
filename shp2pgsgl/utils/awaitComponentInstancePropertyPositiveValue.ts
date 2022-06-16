import { awaitProperty } from './awaitProperty'
export const awaitComponentInstancePropertyPositiveValue = async options => {
    const { componentInstance, propertiesPaths } = options
    let isPromiseAll = options.isPromiseAll

    if (isPromiseAll === undefined) {
        isPromiseAll = true
    }

    let waitingPropertiesPromises: any = null
    if (Array.isArray(propertiesPaths)) {
        waitingPropertiesPromises = propertiesPaths.map(propertyPath => {
            return awaitProperty(componentInstance, propertyPath)
        })
        if (isPromiseAll) {
            return await Promise.all(waitingPropertiesPromises)
        }
        for (const waitingPropertyPromise of waitingPropertiesPromises) {
            await waitingPropertyPromise
        }
        return
    }
    return await awaitProperty(componentInstance, propertiesPaths)
}
