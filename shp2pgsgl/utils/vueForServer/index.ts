import Vue from './VueForServer'
import { useOutsideResolvingPromise } from '@/utils'
interface asyncVueInstance {
    $createdPromise: Promise<any>
    [x: string | number | symbol]: unknown
}
type AsyncVue = (options: any) => asyncVueInstance
export const asyncVue: AsyncVue = options => {
    const originCreated = options.created
    const isAsyncOriginCreated =
        originCreated && originCreated.constructor.name == 'AsyncFunction'
    options.created = function (this: any) {
        if (isAsyncOriginCreated) {
            this.$createdPromise = useOutsideResolvingPromise()
            originCreated.call(this).then(() => {
                this.$createdPromise.resolve(this)
            })
            return
        }
        if (originCreated) {
            originCreated.call(this)
        }
        this.$createdPromise = Promise.resolve(this)
        return
    }

    const instance: asyncVueInstance = new Vue(options)
    return instance
}
export { Vue }
