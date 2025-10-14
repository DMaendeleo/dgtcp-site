// utils/graphql.ts
import {PAYLOAD_DOCKER_GRAPHQL_URL} from "$lib/utils/staticPaths";

export async function fetchGraphQL<T = any>(
    query: string,
    variables?: Record<string, any>,
    headers: Record<string, string> = {}
): Promise<T> {
    const basePath = PAYLOAD_DOCKER_GRAPHQL_URL;
    if (!basePath) {
        // helpful guard so you notice missing env in the container
        throw new Error('PAYLOAD_DOCKER_GRAPHQL_URL is not set');
    }
    console.log(basePath.toString())

    const res = await fetch(basePath, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            ...headers,
        },
        body: JSON.stringify({
            query,
            variables,
        }),
    });

    if (!res.ok) {
        const text = await res.text();
        throw new Error(`GraphQL request failed: ${res.status} ${res.statusText}\n${text}`);
    }

    const json = await res.json();
    console.log(`GraphQL request Succeeded: ${res.status} ${res.statusText}  ${JSON.stringify(json.data, null, 2)}`);
    // console.log(`GraphQL request Succeeded: ${res.status} ${res.statusText}\n${json.data}`)
    if (json.errors) {
        console.error('GraphQL errors:', json.errors);
        throw new Error(JSON.stringify(json.errors, null, 2));
    }

    return json.data;
}
