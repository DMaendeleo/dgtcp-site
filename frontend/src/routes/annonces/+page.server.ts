import type {Annonces} from "$lib/types/Annonce";
import {fetchGraphQL} from "$lib/graphql/utils/utils";
import {queryAllNewsList} from "$lib/graphql/Annonces";
import {env as publicEnv} from "$env/dynamic/public";
import {env} from "$env/dynamic/private";

export const load = async ({fetch}) => {

    const nVariables = {
        "page": 1,
        "limit": 12,
        "sort": "-createdAt"
    }

    const newsData: Annonces = await fetchGraphQL(queryAllNewsList, nVariables);

    const API = 'https://api.x.com/2';
    const xf = (path: string) => fetch(API + path, {headers: {Authorization: `Bearer ${env.PRIVATE_X_AUTHORIZATION_TOKEN}`}});

    const qs = new URLSearchParams({
        max_results: '5',
        exclude: 'retweets,replies',
        'tweet.fields': 'created_at, public_metrics,attachments',
        expansions: 'attachments.media_keys,author_id',
        'media.fields': 'url,preview_image_url,width,height',
        'user.fields': 'name,username,profile_image_url'
    });
    const z = await xf(`/users/${publicEnv.PUBLIC_MIN_FINANCE_X_ID}/tweets?` + qs.toString())
    const t = await z.json()

    console.log(`RestAPI X request Succeeded: ${z.status} ${z.statusText}  ${JSON.stringify(z.data, null, 2)}`);

    // simple join of expansions
    const users = new Map(t.includes?.users?.map((x: any) => [x.id, x]) ?? []);
    const media = new Map(t.includes?.media?.map((m: any) => [m.media_key, m]) ?? []);
    const tweets = (t.data ?? []).map((tw: any) => ({
        id: tw.id,
        text: tw.text,
        created_at: tw.created_at,
        metrics: tw.public_metrics,
        author: users.get(tw.author_id),
        media: (tw.attachments?.media_keys ?? []).map((k: string) => media.get(k))
    }));

    console.log(env.PRIVATE_X_AUTHORIZATION_TOKEN)
    console.log(publicEnv.PUBLIC_MIN_FINANCE_X_ID)
    console.log(tweets)


    return {news: newsData as Annonces, tweets}
}
