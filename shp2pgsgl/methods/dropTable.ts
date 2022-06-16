export default async function ({ pgClient, dropTableName }) {
    const query = await pgClient
        .query(
            `
          DROP TABLE "${dropTableName}"
        `
        )
        .catch(error => {
            // console.error('Table drop error:', error)
        })
}
