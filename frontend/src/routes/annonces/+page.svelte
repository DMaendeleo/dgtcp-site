<script lang="ts">

    import Header from "$lib/layouts/dgtcp/Header.svelte";
    import Footer from "$lib/layouts/dgtcp/Footer.svelte";
    import Twitter from "$lib/layouts/twittercard/Twitter.svelte";
    import type {Annonces} from "$lib/types/Annonce";
    import {shortDate, fullDate, subscribeNewsLetter} from "$lib/utils/genericUtils";
    import NewsLetter from "$lib/layouts/newsletter/NewsLetter.svelte";
    import { env as publicEnv } from '$env/dynamic/public';

    export let data
    const {news} = data

    const mAnnonces = news as Annonces

    // Mock data — swap with your API results later.

    const years = [2023, 2024, 2025];

    let selectedYear: number | 'all' = 'all';

    $: filtered =
        selectedYear === 'all'
            ? mAnnonces.Annonces.docs
            : mAnnonces.Annonces.docs.filter((a) => a.year === selectedYear);


</script>

<Header/>

<!-- PAGE -->
<section class="mx-auto w-full max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
    <!-- Title -->
    <header class="text-center my-20">
        <h1 class="font-extrabold leading-tight tracking-tight text-[clamp(1.9rem,6vw,3.5rem)] text-blue-700">
            Annonces et activités
            <br class="block"/>
            <span class="text-blue-800">à la DGTCP</span>
        </h1>
        <div class="mx-auto mt-14 h-px w-24 bg-blue-200"></div>
    </header>

    <!-- Year tabs (scrollable on mobile) -->
    <nav
            aria-label="Filtrer par année"
            class="mt-8 overflow-x-auto pb-2 [scrollbar-width:none] [-ms-overflow-style:none]"
    >
        <ul class="flex min-w-max items-center gap-4 text-sm font-semibold text-slate-500">
            <li>
                <button
                        class="rounded-full px-3 py-1 transition hover:text-slate-900"
                        class:!text-blue-700={selectedYear === 'all'}
                        class:!bg-blue-50={selectedYear === 'all'}
                        on:click={() => (selectedYear = 'all')}
                >
                   Tout
                </button>
            </li>
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
                                            src={ publicEnv.PUBLIC_IMAGE_BASE_URL  + n.image.url}
                                            alt=""
                                            class="h-14 w-20 flex-none rounded-md object-cover ring-1 ring-slate-200"
                                    />
                                    <div class="min-w-0">
                                        <p class="line-clamp-2 text-xs font-medium text-slate-800">
                                            {n.headline}
                                        </p>
                                        <p class="mt-1 text-[11px] text-slate-500">{shortDate(n.createdAt)}</p>
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
            {#each filtered as oneNews}
                <article
                        class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200"
                >
                    <img
                            src={ publicEnv.PUBLIC_IMAGE_BASE_URL + oneNews.image.url}
                            alt="oneNews."
                            class="h-56 w-full object-cover sm:h-80"
                            loading="lazy"
                    />
                    <div class="space-y-2 p-5 sm:p-6">
                        <h3 class="text-base font-extrabold text-slate-900 sm:text-lg">
                            {oneNews.headline}
                        </h3>
                        <p class="text-sm leading-relaxed text-slate-700  line-clamp-3">
                            {oneNews.description}
                        </p>
                        <p class="pt-2 text-xs font-medium tracking-wide text-slate-500">
                            {fullDate(oneNews.createdAt)}
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

<NewsLetter onSubscribe={subscribeNewsLetter}/>
<Footer/>