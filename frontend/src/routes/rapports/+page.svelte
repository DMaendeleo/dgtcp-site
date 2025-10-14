<script lang="ts">


    import Header from "$lib/layouts/dgtcp/Header.svelte";
    import Footer from "$lib/layouts/dgtcp/Footer.svelte";
    import type {Rapports} from '$lib/types/Rapport';

    import folder_icon_400 from "$lib/assets/dgtcp/folder-icon-400.png";
    import NewsLetter from "$lib/layouts/newsletter/NewsLetter.svelte";
    import {subscribeNewsLetter} from "$lib/utils/utils";
    // import type {Annonces} from "$lib/types/Annonce";

    export let data
    const {rapports} = data

    const mRapports = rapports as Rapports

    // const mRapports : Rapports = {
    //     Rapports : {
    //         docs : [{
    //             id: 123,
    //             title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //             description: "RDC-BAD: Le Ministre des Finances\n" +
    //                 "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //             year: 2024,
    //             dateUploaded: "sample s sample s",
    //             filename: "sample s sample s",
    //             mimeType: "sample s sample s",
    //             filesize: "sample s sample s",
    //             url: "sample s sample s",
    //             createdAt: "2025-10-13T01:51:32.436Z",
    //             updatedAt: "2025-10-13T01:51:32.436Z",
    //         },
    //             {
    //                 id: 12,
    //                 title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //                 description:"RDC-BAD: Le Ministre des Finances\n" +
    //                     "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //                 year: 2025,
    //                 dateUploaded: "sample xxxx",
    //                 filename: "sample xxxx",
    //                 mimeType: "sample xxxx",
    //                 filesize: "sample xxxx",
    //                 url: "sample xxxx",
    //                 createdAt: "2025-10-13T01:51:32.436Z",
    //                 updatedAt: "2025-10-13T01:51:32.436Z",
    //             },
    //             {
    //                 id: 14,
    //                 title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //                 description:"RDC-BAD: Le Ministre des Finances\n" +
    //                     "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //                 year: 2026,
    //                 dateUploaded: "sample xxxx",
    //                 filename: "sample xxxx",
    //                 mimeType: "sample xxxx",
    //                 filesize: "sample xxxx",
    //                 url: "sample xxxx",
    //                 createdAt: "2025-10-13T01:51:32.436Z",
    //                 updatedAt: "2025-10-13T01:51:32.436Z",
    //             },
    //             {
    //                 id: 17,
    //                 title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //                 description:"RDC-BAD: Le Ministre des Finances\n" +
    //                     "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //                 year: 2023,
    //                 dateUploaded: "sample xxxx",
    //                 filename: "sample xxxx",
    //                 mimeType: "sample xxxx",
    //                 filesize: "sample xxxx",
    //                 url: "sample xxxx",
    //                 createdAt: "2025-10-13T01:51:32.436Z",
    //                 updatedAt: "2025-10-13T01:51:32.436Z",
    //             },
    //             {
    //                 id: 20,
    //                 title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //                 description:"RDC-BAD: Le Ministre des Finances\n" +
    //                     "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //                 year: 2022,
    //                 dateUploaded: "sample xxxx",
    //                 filename: "sample xxxx",
    //                 mimeType: "sample xxxx",
    //                 filesize: "sample xxxx",
    //                 url: "sample xxxx",
    //                 createdAt: "2025-10-13T01:51:32.436Z",
    //                 updatedAt: "2025-10-13T01:51:32.436Z",
    //             },
    //             {
    //                 id: 29,
    //                 title: "Manuel-de-procedures-DGTCP-2 2024 - 2025",
    //                 description:"RDC-BAD: Le Ministre des Finances\n" +
    //                     "Doudou Fwamba Likunde Li-Botayi et le Groupe de la Banque Africaine",
    //                 year: 2020,
    //                 dateUploaded: "sample xxxx",
    //                 filename: "sample xxxx",
    //                 mimeType: "sample xxxx",
    //                 filesize: "sample xxxx",
    //                 url: "sample xxxx",
    //                 createdAt: "2025-10-13T01:51:32.436Z",
    //                 updatedAt: "2025-10-13T01:51:32.436Z",
    //             }
    //         ],
    //         pages : 1,
    //         totalPages : 5,
    //         hasNextPage : false,
    //         hasPrevPage : false
    //     }
    // }

    const page = mRapports.Rapports?.page ?? 1;
    const totalPages = mRapports.Rapports?.totalPages ?? 1;

    // sidebar years: prefer server-provided, else derive from docs
    const years: number[] =
        (data as any).years ??
        Array.from(new Set((mRapports.Rapports?.docs ?? []).map((d: any) => d.year))).sort((a, b) => b - a);

    // read search params for links
    const currentYear = (data as any).year ?? null;

    function pageHref(p: number) {
        const params = new URLSearchParams();
        if (currentYear) params.set('year', String(currentYear));
        params.set('page', String(p));
        return `?${params.toString()}`;
    }

    function yearHref(y?: number) {
        const params = new URLSearchParams();
        if (y) params.set('year', String(y));
        // reset to first page on year change
        params.set('page', '1');
        return `?${params.toString()}`;
    }

    async function share(url?: string, title?: string) {
        try {
            if (url && navigator.share) await navigator.share({url, title});
            else if (url) await navigator.clipboard.writeText(url);
        } catch {
        }
    }

    // export let heading = "Rapports d'activités de la DGTCP";
</script>

<Header/>

<!-- PAGE WRAPPER -->
<div class="mx-auto max-w-7xl px-4 py-6 md:py-10">


    <!--    <header class="text-center my-20">-->
    <!--        <h2-->
    <!--                class="font-extrabold tracking-tight text-[clamp(1.9rem,6vw,3.5rem)]-->
    <!--               leading-[1.05] text-[#1E66FF]"-->
    <!--        >-->
    <!--            {#each heading.split('\n') as line}-->
    <!--                <span class="block">{line} </span>-->
    <!--            {/each}-->
    <!--        </h2>-->
    <!--        <div class="mx-auto mt-14 h-[2px] w-40 bg-[#c9d7ff] md:w-128"></div>-->
    <!--    </header>-->

    <header class="text-center my-20">
        <h1 class="font-extrabold leading-tight tracking-tight text-[clamp(1.9rem,6vw,3.5rem)] text-blue-700 ">
            Rapports d'activités
            <br class="block"/>
            <!--            <br class="hidden sm:block"/>-->
            <span class="text-blue-800">de la DGTCP</span>
        </h1>
        <div class="mx-auto mt-14 h-px w-24 bg-blue-200"></div>
    </header>

    <!-- GRID: mobile-first (1 col), desktop gets sidebar -->
    <div class="grid grid-cols-1 gap-8 md:grid-cols-12">

        <!-- SIDEBAR (hidden on mobile) -->
        <aside class="hidden md:block md:col-span-3">
            <div class="rounded-2xl bg-blue-700 text-white p-5 sticky top-6">
                <h2 class="text-xl font-extrabold leading-tight">Rapports des activités</h2>
                <div class="mt-4 space-y-1">
                    {#each years as y}
                        <a
                                class="block rounded-lg px-3 py-2 text-sm transition
                     hover:bg-white/10 {currentYear == y ? 'bg-white/10 font-semibold' : ''}"
                                href={yearHref(y)}>{y}</a>
                    {/each}
                </div>

                <div class="mt-6 h-px w-full bg-white/40"></div>

                <h3 class="mt-6 text-lg font-extrabold">Autres archives</h3>
                <div class="mt-3 space-y-1">
                    {#each years.slice(1) as y}
                        <a class="block rounded-lg px-3 py-2 text-sm transition hover:bg-white/10"
                           href={yearHref(y)}>{y}</a>
                    {/each}
                </div>
            </div>

            <!-- Latest news placeholder box -->
            <div class="mt-6 rounded-2xl bg-white p-5 shadow-sm">
                <h4 class="text-lg font-extrabold text-blue-700">Latest News</h4>
                <p class="mt-2 text-sm text-gray-600">Branch this section to your news collection later.</p>
            </div>
        </aside>

        <!-- MAIN CONTENT -->
        <main class="md:col-span-9">
            <!-- Year heading -->
            {#if currentYear}
                <h2 class="text-xl font-semibold text-gray-800 mb-4">{currentYear}</h2>
            {/if}

            <!-- LIST -->
            <div class="space-y-5">
                {#each (mRapports.Rapports?.docs ?? []) as r}
                    <article class="rounded-3xl border border-blue-200 bg-white p-4 md:p-6 flex items-start gap-4">
                        <!-- folder / thumbnail -->
                        <div class="shrink-0">
                            <!-- Replace with your image if available -->
                            <!--                            <div class="size-20 md:size-28 rounded-2xl bg-gradient-to-b from-blue-300 to-blue-500 shadow-inner"></div>-->
                            <div
                                    class="flex shrink-0 items-center justify-center rounded-[28px]
                   border-2 border-[#1E66FF] p-6 md:p-8"
                            >
                                <img
                                        src={folder_icon_400}
                                        alt="Dossier"
                                        class="h-16 w-16 md:h-24 md:w-24 object-contain"
                                        loading="lazy"
                                        decoding="async"
                                />
                            </div>
                        </div>

                        <!-- text -->
                        <div class="min-w-0 flex-1">
                            <a href={r.url} target="_blank" rel="noopener"
                               class="block text-blue-700 font-semibold hover:underline line-clamp-2">
                                {r.title}
                            </a>
                            <p class="mt-1 text-sm text-gray-600 line-clamp-2">{r.description}</p>
                            <p class="mt-1 text-xs text-gray-400">{new Date(r.dateUploaded ?? r.createdAt).toLocaleDateString()}</p>

                            <!-- actions -->
                            <div class="mt-3 flex flex-wrap gap-3">
                                {#if r.url}
                                    <a
                                            href={r.url}
                                            target="_blank"
                                            rel="noopener"
                                            class="inline-flex items-center rounded-xl border border-blue-300 px-3 py-1.5 text-sm font-medium text-blue-700 hover:bg-blue-50">
                                        Télécharger
                                    </a>
                                    <button
                                            type="button"
                                            on:click={() => share(r.url, r.title)}
                                            class="inline-flex items-center rounded-xl border border-blue-300 px-3 py-1.5 text-sm font-medium text-blue-700 hover:bg-blue-50">
                                        Partager
                                    </button>
                                {/if}
                            </div>
                        </div>
                    </article>
                {/each}

                {#if (mRapports.Rapports?.docs?.length ?? 0) === 0}
                    <p class="text-sm text-gray-500">Aucun rapport trouvé.</p>
                {/if}
            </div>

            <!-- PAGINATION -->
            {#if totalPages > 1}
                <nav class="mt-8 flex items-center justify-center gap-2">
                    <a
                            href={pageHref(Math.max(1, page - 1))}
                            aria-label="Précédent"
                            class="rounded-xl border px-3 py-2 text-sm hover:bg-blue-50 disabled:pointer-events-none disabled:opacity-40"
                            class:disabled={page <= 1}>
                        ‹
                    </a>

                    {#each Array.from({length: totalPages}, (_, i) => i + 1) as p}
                        <a
                                href={pageHref(p)}
                                class="rounded-xl border px-3 py-2 text-sm hover:bg-blue-50 {p === page ? 'bg-blue-600 text-white border-blue-600' : ''}">
                            {p}
                        </a>
                    {/each}

                    <a
                            href={pageHref(Math.min(totalPages, page + 1))}
                            aria-label="Suivant"
                            class="rounded-xl border px-3 py-2 text-sm hover:bg-blue-50 disabled:pointer-events-none disabled:opacity-40"
                            class:disabled={page >= totalPages}>
                        ›
                    </a>
                </nav>
            {/if}
        </main>
    </div>
</div>

<NewsLetter onSubscribe={subscribeNewsLetter}/>

<Footer/>