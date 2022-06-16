import path from 'path'
const {
    promises: { readdir },
} = require('fs')
type GetShpListPropsType = {
    pathToShapes: string
}
export default async function ({ pathToShapes }: GetShpListPropsType) {
    const filesInSphDir = await readdir(pathToShapes, { withFileTypes: true })
    const shpList = filesInSphDir.reduce((accumulator, file) => {
        const fileName = file.name
        const fileBasename = path.parse(fileName).name
        if (!accumulator.includes(fileBasename)) {
            accumulator.push(fileBasename)
        }
        return accumulator
    }, [])
    return shpList
}
