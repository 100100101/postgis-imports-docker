const isEmpty = val => {
    if (Array.isArray(val)) {
        return val.length === 0
    } else if (typeof val === 'object' && val !== null) {
        return Object.keys(val).length === 0
    } else return val === null || val === undefined
}

const isFunction = func => {
    return typeof func === 'function'
}

const createComputed = (self, key) => {
    return () => {
        return self[key].resolvedWith
    }
}

module.exports = {
    install(Vue, options) {
        options = options || {}

        if (!options.getComputedName) {
            options.getComputedName = (vm, funcName) => {
                const withoutPrefix = funcName.replace(/^(fetch|get|load)/, '')
                return (
                    withoutPrefix.slice(0, 1).toLowerCase() +
                    withoutPrefix.slice(1)
                )
            }
        }

        const wrapMethod = function (func, vm, funcName) {
            return function () {
                const vmFunc = vm[funcName]
                vmFunc.isCalled = true
                vmFunc.isPending = true
                vmFunc.isResolved = false
                vmFunc.isRejected = false
                vmFunc.resolvedWith = null
                vmFunc.resolvedWithSomething = false
                vmFunc.resolvedWithEmpty = false
                vmFunc.rejectedWith = null

                try {
                    const result = func.call(vm, ...arguments)

                    if (result && result.then) {
                        vmFunc.promise = result
                            .then(res => {
                                vmFunc.isPending = false
                                vmFunc.isResolved = true
                                vmFunc.resolvedWith = res

                                const empty = isEmpty(res)
                                vmFunc.resolvedWithEmpty = empty
                                vmFunc.resolvedWithSomething = !empty

                                return res
                            })
                            .catch(err => {
                                vmFunc.isPending = false
                                vmFunc.isRejected = true
                                vmFunc.rejectedWith = err

                                if (isFunction(options.onError)) {
                                    options.onError(
                                        err,
                                        vmFunc.handleErrorInView,
                                        vm,
                                        funcName,
                                        [...arguments]
                                    )
                                }

                                throw err
                            })

                        return vmFunc.promise
                    } else {
                        // always return a promise for consistency
                        vmFunc.promise = new Promise(resolve => {
                            vmFunc.isPending = false
                            vmFunc.isResolved = true
                            vmFunc.resolvedWith = result

                            const empty = isEmpty(result)
                            vmFunc.resolvedWithEmpty = empty
                            vmFunc.resolvedWithSomething = !empty

                            resolve(result)
                        })

                        return vmFunc.promise
                    }
                } catch (err) {
                    // always return a promise for consistency
                    vmFunc.promise = new Promise((resolve, reject) => {
                        vmFunc.isPending = false
                        vmFunc.isRejected = true
                        vmFunc.rejectedWith = err

                        if (isFunction(options.onError)) {
                            options.onError(
                                err,
                                vmFunc.handleErrorInView,
                                vm,
                                funcName,
                                [...arguments]
                            )
                        }

                        reject(err)
                    })

                    return vmFunc.promise
                }
            }
        }

        Vue.config.optionMergeStrategies.asyncMethods =
            Vue.config.optionMergeStrategies.methods

        Vue.mixin({
            beforeCreate() {
                const asyncMethods = this.$options.asyncMethods
                if (!asyncMethods) {
                    return
                }
                const asyncMethodsEntries = Object.entries(asyncMethods)
                if (!asyncMethodsEntries.length) {
                    return
                }

                for (const asyncMethodKey of Object.keys(asyncMethods)) {
                    const func = wrapMethod(
                        asyncMethods[asyncMethodKey],
                        this,
                        asyncMethodKey
                    )
                    Vue.util.defineReactive(this, asyncMethodKey, func)
                    const extra = {
                        execute: func,
                        promise: null,
                        isCalled: false,
                        isPending: false,
                        isResolved: false,
                        isRejected: false,
                        resolvedWith: null,
                        resolvedWithSomething: false,
                        resolvedWithEmpty: false,
                        rejectedWith: null,
                        handleErrorInView: false,
                    }
                    for (const prop in extra) {
                        Vue.util.defineReactive(func, prop, extra[prop])
                    }
                    // add computed
                    if (options.createComputed) {
                        this.$options.computed = this.$options.computed || {}
                        const computedName = options.getComputedName(
                            this,
                            asyncMethodKey
                        )

                        if (!computedName || !computedName.length) {
                            throw new Error(
                                'Computed name for method ' +
                                    asyncMethodKey +
                                    ' is empty, return a non zero length string'
                            )
                        }
                        this.$options.computed[computedName] = createComputed(
                            this,
                            asyncMethodKey
                        )
                    }
                }
            },
        })
    },
}
