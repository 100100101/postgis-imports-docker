declare namespace globalThis {
    // interface NodeRequire {
    //     hot: any
    // }
    // Для функции у которой ожидпется какой-то результат. Если вернула undefined это равносильно неудачному заверщению
    type ResErrReturn =
        | {
              result?: any
              error?: any
          }
        | undefined
    // ResErrReturn для async функции
    type ResErrReturnPromise = Promise<ResErrReturn>
    interface NodeModule {
        hot: {
            active: any
            accept: any
            decline: any
            dispose: any
            addDisposeHandler: any
            removeDisposeHandler: any
            _acceptedDependencies: any
            _declinedDependencies: any
            _selfAccepted: any
            _selfDeclined: any
            _disposeHandlers: any
            [key: string]: any
        }
    }

    type UseHotRequireReturn = {
        value: any
        // callback: (hotAcceptCallback: HotAcceptCallback) => HotAcceptCallback
        callback: any
    }
    type UseHotRequire = (path: string) => UseHotRequireReturn
    type HotAcceptCallback = (module: any) => void
    declare const useHotRequire: UseHotRequire
    interface global {
        vm: any
    }
}
