export default async function ({ pgClient, checkTableName }) {
    const query = await pgClient
        .query(
            `
      SELECT *
      FROM "${checkTableName}"
      LIMIT 1
      `
        )
        .catch(() => null)

    const isTableExists = !!query

    return isTableExists
}
