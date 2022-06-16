export const runAtDate = (
    func,
    dateUtcMs,
    writeCurrentTimeoutInObject,
    propKey
) => {
    const diff = Math.max(dateUtcMs - +new Date(new Date().toUTCString()), 0)
    //setTimeout limit is MAX_INT32=(2^31-1)
    if (diff > 0x7fffffff) {
        writeCurrentTimeoutInObject[propKey] = setTimeout(() => {
            runAtDate(func, dateUtcMs, writeCurrentTimeoutInObject, propKey)
        }, 0x7fffffff)
    } else {
        writeCurrentTimeoutInObject[propKey] = setTimeout(func, diff)
    }
}
