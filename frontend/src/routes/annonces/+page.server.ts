import type {Annonces} from "$lib/types/Annonce";
import {fetchGraphQL} from "$lib/graphql/utils/utils";
import {queryAllNewsList} from "$lib/graphql/Annonces";

export const load = async ({fetch}) => {

    const nVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt"
    }

    const mnj = "http://localhost:443/api/media/file/45e7245ebba5bba8f7e340ea2fd58084~tplv-tiktokx-cropcenter-1080-1080.jpeg"
    const newsData: Annonces = await fetchGraphQL(queryAllNewsList, nVariables);

    return {news: newsData as Annonces}
}
