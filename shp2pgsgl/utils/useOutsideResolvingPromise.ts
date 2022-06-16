export const useOutsideResolvingPromise = (callback?) => {
    let promiseResolve: any = null
    const promise: any = new Promise((resolve, reject) => {
        promiseResolve = resolve
        return callback && callback(resolve, reject)
    })
    promise.resolve = promiseResolve
    return promise
}
