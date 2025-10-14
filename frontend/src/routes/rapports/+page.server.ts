import type {Rapports} from '$lib/types/Rapport';
import {fetchGraphQL} from "$lib/graphql/utils/utils";
import {queryAllRapportsList} from "$lib/graphql/Rapports";
import {queryAllNewsList} from "$lib/graphql/Annonces";
import type {Annonces} from "$lib/types/Annonce";


export const load = async ({fetch}) => {

    const mVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt",
    }
    const nVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt"
    }

    const rapportsData: Rapports = await fetchGraphQL(queryAllRapportsList, mVariables);
    const newsData: Annonces = await fetchGraphQL(queryAllNewsList, nVariables);

    return {rapports: rapportsData as Rapports, news: newsData as Annonces}
}
