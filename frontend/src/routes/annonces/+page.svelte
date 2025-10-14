<script lang="ts">


    import Header from "$lib/layouts/dgtcp/Header.svelte";
    import Footer from "$lib/layouts/dgtcp/Footer.svelte";
    import Twitter from "$lib/layouts/twittercard/Twitter.svelte";
    import type {Annonces} from "$lib/types/Annonce";
    import {PAYLOAD_MEDIA_HEADER_PATH_URL} from "$lib/static/staticPaths";


    export let data
    const {news} = data

    const mAnnonces = news as Annonces


    // Mock data — swap with your API results later.
    type Announce = {
        id: string;
        title: string;
        summary: string;
        date: string;     // ISO
        image: string;    // URL
        year: number;
    };

    const years = [2022, 2023, 2024, 2025];

    let selectedYear = 2025;

    const all: Announce[] = [
        {
            id: "1",
            title: "Activité de la DGTCP, Avril à septembre 2025",
            summary:
                "Mise en œuvre opérationnelle de la politique et régie budgétaire en termes de la réforme à la DGTCP",
            date: "2025-09-21",
            image:
                "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1600&auto=format&fit=crop",
            year: 2025
        },
        {
            id: "2",
            title: "Note d’information sur la régie budgétaire",
            summary:
                "Présentation des actions clés menées au deuxième trimestre et perspectives Q4.",
            date: "2025-06-30",
            image:
                "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=1600&auto=format&fit=crop",
            year: 2025
        },
        // add more across years as needed…
    ];

    $: filtered = all.filter((a) => a.year === selectedYear);

    function fmtDate(iso: string) {
        return new Date(iso).toLocaleDateString("fr-FR", {
            year: "numeric",
            month: "long",
            day: "2-digit"
        });
    }


</script>


<Header/>

<!-- PAGE -->
<section class="mx-auto w-full max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
    <!-- Title -->
    <header class="text-center">
        <h1 class="text-3xl font-extrabold leading-tight tracking-tight text-blue-700 sm:text-5xl">
            Annonces et activités <br class="hidden sm:block"/>
            <span class="text-blue-800">à la DGTCP</span>
        </h1>
        <div class="mx-auto mt-4 h-px w-24 bg-blue-200"></div>
    </header>

    <!-- Year tabs (scrollable on mobile) -->
    <nav
            aria-label="Filtrer par année"
            class="mt-8 overflow-x-auto pb-2 [scrollbar-width:none] [-ms-overflow-style:none]"
    >
        <ul class="flex min-w-max items-center gap-4 text-sm font-semibold text-slate-500">
            {#each years as y}
                <li>
                    <button
                            class="rounded-full px-3 py-1 transition hover:text-slate-900"
                            class:selectedYear={y === selectedYear}
                            on:click={() => (selectedYear = y)}
                            class:!text-blue-700={y === selectedYear}
                            class:!bg-blue-50={y === selectedYear}
                    >
                        {y}
                    </button>
                </li>
            {/each}
        </ul>
    </nav>

    <!-- Layout: mobile = single column; desktop = 3 columns with sidebars -->
    <div class="mt-8 grid grid-cols-1 gap-8 lg:grid-cols-[280px_minmax(0,1fr)_320px]">
        <!-- LEFT SIDEBAR (hidden on mobile) -->
        <aside class="hidden lg:block">
            <div class="sticky top-8 space-y-6">
                <section class="rounded-2xl bg-white p-4 shadow-sm ring-1 ring-slate-200">
                    <h2 class="text-base font-bold text-slate-900">Rapports des activités</h2>
                    <ul class="mt-3 space-y-2 text-sm">
                        {#each years as y}
                            <li>
                                <a
                                        href="#"
                                        class="block rounded-md px-3 py-2 hover:bg-slate-50 hover:text-slate-900"
                                >{y}</a
                                >
                            </li>
                        {/each}
                    </ul>
                </section>

                <section class="rounded-2xl bg-white p-4 shadow-sm ring-1 ring-slate-200">
                    <h2 class="text-base font-bold text-slate-900">Autres archives</h2>
                    <ul class="mt-3 space-y-2 text-sm">
                        <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2022</a></li>
                        <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2023</a></li>
                        <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2024</a></li>
                        <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2025</a></li>
                    </ul>

                    <div class="mt-6">
                        <h3 class="text-sm font-semibold text-slate-700">Latest News</h3>
                        <ul class="mt-3 space-y-4">
                            {#each filtered.slice(0, 4) as n}
                                <li class="flex gap-3">
                                    <img
                                            src={n.image}
                                            alt=""
                                            class="h-14 w-20 flex-none rounded-md object-cover ring-1 ring-slate-200"
                                    />
                                    <div class="min-w-0">
                                        <p class="line-clamp-2 text-xs font-medium text-slate-800">
                                            {n.title}
                                        </p>
                                        <p class="mt-1 text-[11px] text-slate-500">{fmtDate(n.date)}</p>
                                    </div>
                                </li>
                            {/each}
                        </ul>
                    </div>
                </section>
            </div>
        </aside>

        <!-- CENTER FEED -->
        <main class="space-y-10">
            {#each mAnnonces.Annonces.docs as oneNews}
                <article
                        class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200"
                >
                    <img
                            src={PAYLOAD_MEDIA_HEADER_PATH_URL + oneNews.image.url}
                            alt="oneNews."
                            class="h-56 w-full object-cover sm:h-80"
                            loading="lazy"
                    />
                    <div class="space-y-2 p-5 sm:p-6">
                        <h3 class="text-base font-extrabold text-slate-900 sm:text-lg">
                            {oneNews.headline}
                        </h3>
                        <p class="text-sm leading-relaxed text-slate-700">
                            {oneNews.description}
                        </p>
                        <p class="pt-2 text-xs font-medium tracking-wide text-slate-500">
                            {fmtDate(oneNews.createdAt)}
                        </p>

                        <div class="mt-3 flex flex-wrap gap-3">
                            <a
                                    href={"/annonces/" + oneNews.slug}
                                    class="rounded-xl px-4 py-2 text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
                            >Voir plus</a
                            >
                            <button
                                    type="button"
                                    class="rounded-xl border px-4 py-2 text-sm font-semibold text-blue-700 border-blue-200 hover:bg-blue-50"
                                    aria-label="Partager l’annonce"
                            >
                                Partager
                            </button>
                        </div>
                    </div>
                </article>
            {/each}
        </main>

        <!-- RIGHT SIDEBAR (hidden on mobile) -->
        <aside class="hidden lg:block">
            <div class="sticky top-8 space-y-6">
                <section class="rounded-2xl bg-white p-4 shadow-sm ring-1 ring-slate-200">
                    <h2 class="text-base font-bold text-slate-900">Twitter latest news</h2>
                    <!-- Replace these with real embeds or your widget -->
                    <div class="mt-4 space-y-4">
                        {#each Array(3) as _}
                            <!--                            <div class="rounded-xl border border-slate-200 p-3">-->
                            <!--                                <div class="h-28 w-full rounded-md bg-slate-50"></div>-->
                            <!--                            </div>-->
                            <Twitter/>
                        {/each}
                    </div>
                </section>
            </div>
        </aside>
    </div>
</section>

<style>
    /* optional: hide scrollbar for the year scroller (Firefox handled above) */
    nav::-webkit-scrollbar {
        display: none;
    }
</style>


<Footer/>