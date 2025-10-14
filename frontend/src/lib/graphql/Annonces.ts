export const queryAllNewsList =
    `
       query AnnoncesList( $page: Int, $limit: Int, $sort: String){
       Annonces(page: $page, limit: $limit, sort: $sort) {
          docs {
              id
              headline
              subheadline
              description
              slug
              localisation
              year
              image {
                id
                filename
                mimeType
                filesize
                url
              }
              createdAt
              updatedAt
          }
          page
          totalPages
          hasNextPage
          hasPrevPage
       }
    }`
;