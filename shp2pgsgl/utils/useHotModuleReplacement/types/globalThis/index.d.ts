declare namespace globalThis {
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
}
