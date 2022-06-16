export const awaitProperty = async (componentInstance, propertyPath) => {
    let unwatch = null
    let propertyValue = null
    await new Promise((resolve: any) => {
        unwatch = componentInstance.$watch(
            propertyPath,
            newValue => {
                if (!newValue) return
                propertyValue = newValue
                resolve()
            },
            {
                immediate: true,
            }
        )
    }).then(unwatch)
    return propertyValue
}
