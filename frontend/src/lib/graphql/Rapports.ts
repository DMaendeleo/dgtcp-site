export const queryAllRapportsList = `
    query RapportsList($page: Int, $limit: Int, $sort: String) {
      Rapports(page: $page, limit: $limit, sort: $sort) {
        docs {
          id
          title
          description
          year
          dateUploaded
          filename
          mimeType
          filesize
          url
          createdAt
          updatedAt
        }
        page
        totalPages
        hasNextPage
        hasPrevPage
      }
    }
  `;