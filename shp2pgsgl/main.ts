// import 'dotenv/config'
import path from 'path'
import { Vue, onProcessDeath } from '@/utils'
import getPgClient from '@/methods/getPgClient'
import getShpList from '@/methods/getShpList'
import shp2pgsql from '@/methods/shp2pgsql'
import checkTableExists from '@/methods/checkTableExists'
import dropTable from '@/methods/dropTable'
// import KoaServer from './components/KoaServer'
const {
    IS_DROP_EXISTING_TABLES,
    DB_SERVICE_HOST_IP,
    PATH_TO_SHAPES,
    CONTAINER_PATH_TO_SHAPES,
    POSTGRES_PORT,
    CONTAINER_DB_HOST,
    INNER_POSTGRES_PORT,
    OUTER_POSTGRES_PORT,
    POSTGRES_DB,
    POSTGRES_USER,
    POSTGRES_PASSWORD,
} = process.env

const pgConnectionOptions = {
    host: CONTAINER_DB_HOST,
    port: INNER_POSTGRES_PORT,
    db: POSTGRES_DB,
    name: POSTGRES_USER,
    password: POSTGRES_PASSWORD,
}

globalThis.vm = new Vue({
    async created(this: any) {
        if (!CONTAINER_PATH_TO_SHAPES)
            return console.error('!CONTAINER_PATH_TO_SHAPES')

        const pgClient = await getPgClient(pgConnectionOptions)

        if (!pgClient) {
            return console.error('!pgClient')
        }

        const shpList = await getShpList({
            // pathToShapes,
            pathToShapes: CONTAINER_PATH_TO_SHAPES,
        })

        for (const shpName of shpList) {
            if (IS_DROP_EXISTING_TABLES === 'true') {
                await dropTable({
                    pgClient,
                    dropTableName: shpName,
                })
            }

            const isTableExists = await checkTableExists({
                pgClient,
                checkTableName: shpName,
            })

            if (isTableExists) continue
            const pathToShape = path.join(CONTAINER_PATH_TO_SHAPES, shpName)
            await shp2pgsql({
                ...pgConnectionOptions,
                pathToShape,
                tableName: shpName,
            })
        }
    },
})
const processEndHandler = () => {
    // console.log('processEndHandler')
}
onProcessDeath(processEndHandler)
module.hot?.dispose(processEndHandler)
