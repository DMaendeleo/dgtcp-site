import type {Rapports} from '$lib/types/Rapport';
import type {Annonces} from "$lib/types/Annonce";

export const load = async ({fetch}) => {
    const query = `
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


    const mVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt",
    }

    const newsQuery =
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

    const nVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt"
    }


// const mVariables = {
//     "page": 1,
//     "limit": 12,
//     "sort": "-createdAt",
//     "where": {
//         "year": {
//             "equals": 2025
//         }
//     }
// }

// const base = "http://backend:4000/"

// const mVariables = {
//     undefined,
//     limit: 12,
//     sort: '-createdAt',
//     where: undefined
//     // where: year ? { year: { equals: Number(year) } } : undefined
// }

    const base = process.env.PAYLOAD_DOCKER_GRAPHQL_URL
    const res = await fetch(`${base}`, {
        method: 'POST',
        headers: {'content-type': 'application/json'},
        body: JSON.stringify({query, mVariables})
    });

    const resNews = await fetch(`${base}`, {
        method: 'POST',
        headers: {'content-type': 'application/json'},
        body: JSON.stringify(
            { query: newsQuery, variables: nVariables})
    });

    const json = await res.json();
    const jsonNews = await resNews.json();
    console.log(json.data)
    console.log(jsonNews.data)


    console.log(JSON.stringify(json.data, null, 2));
    console.log(JSON.stringify(jsonNews, null, 2));

    if (jsonNews.errors) {
        console.log("found an error")
        console.error(json.errors);
        throw new Error('GraphQL error');
    }

    // const { data } = await res.json();
    // return { rapports: data.Rapports };

    return {rapports: json.data as Rapports, news: jsonNews as Annonces}
    // return {rapports: json.data as Rapports}
}
