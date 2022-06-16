import { useOutsideResolvingPromise } from '@/utils/useOutsideResolvingPromise'
const child_process = require('child_process')
export default async function ({
    name,
    password,
    host,
    port,
    db,
    pathToShape,
    tableName,
}) {
    const shp2pgsqlPart = `/usr/lib/postgresql/14/bin/shp2pgsql -s 4326 ${pathToShape} ${tableName} | PGPASSWORD=${password} psql -d ${db} -U ${name} -h localhost -p ${port}`

    const shellString = `ssh root@${host} '${shp2pgsqlPart}'`

    const execProcess = child_process.exec(shellString, {
        stdio: 'inherit',
        encoding: 'utf8',
    })
    console.log('shellString:', shellString)

    execProcess.stdout.on('data', data => {
        console.log('stdout:', data)
    })

    execProcess.stderr.on('data', data => {
        console.error('stderr:', data)
    })

    execProcess.on('error', error => {
        console.log(`child process error: ${error}`)
    })

    const outsideResolvingPromise = useOutsideResolvingPromise()
    execProcess.on('close', code => {
        console.log(`child process close all stdio with code ${code}`)
        outsideResolvingPromise.resolve()
    })

    execProcess.on('exit', code => {
        console.log(`child process exited with code ${code}`)
        outsideResolvingPromise.resolve()
    })
    await outsideResolvingPromise
}
