<!-- src/lib/sections/NewsSection.svelte -->
<script lang="ts">

    import news_one from "$lib/assets/dgtcp/news-one.jpg";
    import welcome from "$lib/assets/dgtcp/welcome.jpg";
    import news_secondary from "$lib/assets/dgtcp/news-secondary.jpg";
    import type {Annonce} from "$lib/types/Annonce";
    import {fullDate, shortDate, shortTime} from "$lib/utils/genericUtils";
    import {env as publicEnv} from "$env/dynamic/public";
    import Twitter from "$lib/layouts/twittercard/Twitter.svelte";

    export let heading = "Annonces et actualités";

    // Featured article (center)
    export let featured: Annonce
    export let allThePosts: Annonce[]
    // Side lists
    export let leftPosts: Annonce[] = []
    export let rightPosts: Annonce[] = []

    const blue = "#1E66FF";
</script>

<section class="w-full bg-[#E6F4FA]">
    <div class="mx-auto max-w-[1200px] px-4 py-12 sm:py-14 md:py-16">
        <!-- Heading -->
        <header class="text-center">
            <h2
                    class="font-extrabold tracking-tight text-[clamp(1.9rem,6vw,3.2rem)]
               leading-[1.05] text-[#1E66FF]"
            >
                {heading}
            </h2>

            <!-- Tri-color underline -->
            <div class="mx-auto my-8 flex h-1.5 w-44 overflow-hidden rounded-full sm:w-52">
                <div class="h-full w-1/3 bg-[#1d5ed6]"></div>
                <div class="h-full w-1/3 bg-[#F2DE00]"></div>
                <div class="h-full w-1/3 bg-[#ff1e1e]"></div>
            </div>
        </header>

        <!-- Layout: 1 col on mobile -> 3 cols on md+ -->

        <!--        <div class="mt-10 grid gap-8 md:[grid-template-columns:320px_minmax(0,1fr)_320px]" >-->
        <!--            &lt;!&ndash; Left list &ndash;&gt;-->
        <!--            <div class="space-y-6">-->
        <!--                {#each leftPosts as p, i (p.id)}-->
        <!--                    <article-->
        <!--                            class="grid grid-cols-[112px_1fr] gap-3 border-b border-slate-300/40 pb-5 last:border-none"-->
        <!--                    >-->
        <!--                        <img-->
        <!--                                src={news_secondary}-->
        <!--                                alt={p.image.url}-->
        <!--                                class="h-24 w-28 rounded object-cover"-->
        <!--                                loading="lazy"-->
        <!--                                decoding="async"-->
        <!--                        />-->

        <!--                        <div class="min-w-0">-->
        <!--                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">-->
        <!--                                {p.headline}-->
        <!--                            </h3>-->
        <!--                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-2">-->
        <!--                                {p.subheadline}-->
        <!--                            </p>-->

        <!--                            <div class="mt-2 flex items-center gap-3 text-[12px] text-slate-500">-->
        <!--                                <span>{shortDate(p.createdAt)}</span>-->
        <!--                                {#if p.createdAt}<span>{shortTime(p.createdAt)}</span>{/if}-->
        <!--                                {#if p.localisation}<span>{p.localisation}</span>{/if}-->

        <!--                                &lt;!&ndash; tiny share icon (red) &ndash;&gt;-->
        <!--                                <svg-->
        <!--                                        class="ml-auto h-3.5 w-3.5 text-[#e22b2b]"-->
        <!--                                        viewBox="0 0 24 24"-->
        <!--                                        fill="none"-->
        <!--                                        stroke="currentColor"-->
        <!--                                        stroke-width="2.3"-->
        <!--                                        stroke-linecap="round"-->
        <!--                                        stroke-linejoin="round"-->
        <!--                                        aria-hidden="true"-->
        <!--                                >-->
        <!--                                    <path d="M4 12v7a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-7"/>-->
        <!--                                    <path d="M16 6l-4-4-4 4"/>-->
        <!--                                    <path d="M12 2v14"/>-->
        <!--                                </svg>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </article>-->
        <!--                {/each}-->
        <!--            </div>-->

        <!--            &lt;!&ndash; Featured (center) &ndash;&gt;-->
        <!--            <article-->
        <!--                    class="rounded-2xl border-1 border-[#AABCD1] shadow-sm"-->
        <!--            >-->
        <!--                &lt;!&ndash; Image &ndash;&gt;-->
        <!--                <img-->
        <!--                        alt={featured.id}-->
        <!--                        class="h-56 w-full rounded-t-2xl object-cover sm:h-64 md:h-72"-->
        <!--                        decoding="async"-->
        <!--                        loading="eager"-->
        <!--                        src={ publicEnv.PUBLIC_IMAGE_BASE_URL + featured.image.url}-->
        <!--                />-->

        <!--                &lt;!&ndash; Body &ndash;&gt;-->
        <!--                <div class="p-5 sm:p-6 md:p-7 text-center">-->
        <!--                    <h3 class="text-xl font-extrabold text-slate-900 sm:text-2xl">-->
        <!--                        {featured.headline}-->
        <!--                    </h3>-->

        <!--                    <p-->
        <!--                            class="mx-auto mt-2 max-w-[70ch] text-base text-slate-700-->
        <!--                   sm:text-lg md:text-xl"-->
        <!--                    >-->
        <!--                        {featured.subheadline}-->
        <!--                    </p>-->

        <!--                    <p class="mt-3 text-sm font-medium text-slate-500">-->
        <!--                        {fullDate(featured.createdAt)}-->
        <!--                    </p>-->

        <!--                    <div class="mt-5 flex justify-center gap-4">-->
        <!--                        <button-->
        <!--                                class="rounded-xl border-2 border-[#1E66FF] px-6 py-3 text-sm font-semibold text-[#1E66FF]-->
        <!--                     hover:bg-[#1E66FF]/5 active:scale-[.99] transition"-->
        <!--                        >-->
        <!--                            Voir plus-->
        <!--                        </button>-->
        <!--                        <button-->
        <!--                                class="rounded-xl border-2 border-[#1E66FF] px-6 py-3 text-sm font-semibold text-[#1E66FF]-->
        <!--                     hover:bg-[#1E66FF]/5 active:scale-[.99] transition"-->
        <!--                        >-->
        <!--                            Partager-->
        <!--                        </button>-->
        <!--                    </div>-->
        <!--                </div>-->

        <!--                <div>-->
        <!--                    &lt;!&ndash; Optional second image (as in mobile mock) &ndash;&gt;-->
        <!--                    <img-->
        <!--                            alt="Illustration complémentaire"-->
        <!--                            class="px-5 mb-5 rounded-2xl object-cover  md:mb-6 object-contain"-->
        <!--                            decoding="async"-->
        <!--                            loading="lazy"-->
        <!--                            src={publicEnv.PUBLIC_IMAGE_BASE_URL + featured.image.url}-->
        <!--                    />-->
        <!--                </div>-->
        <!--            </article>-->

        <!--            &lt;!&ndash; Right list &ndash;&gt;-->
        <!--            <div class="space-y-6">-->
        <!--                {#each rightPosts as p (p.id)}-->
        <!--                    <article-->
        <!--                            class="grid grid-cols-[112px_1fr] gap-3 border-b border-slate-300/40 pb-5 last:border-none"-->
        <!--                    >-->
        <!--                        <img-->
        <!--                                src={news_secondary}-->
        <!--                                alt={p.image.url}-->
        <!--                                class="h-24 w-28 rounded object-contain"-->
        <!--                                loading="lazy"-->
        <!--                                decoding="async"-->
        <!--                        />-->

        <!--                        <div class="min-w-0">-->
        <!--                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">-->
        <!--                                {p.headline}-->
        <!--                            </h3>-->
        <!--                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-4 md:line-clamp-6">-->
        <!--                                {p.subheadline}-->
        <!--                            </p>-->

        <!--                            <div class="mt-2 border-t border-slate-300/40 pt-2 text-[12px] text-slate-500">-->
        <!--                                <span>{shortDate(p.createdAt)}</span>-->
        <!--                                {#if p.createdAt}<span class="mx-2">{shortTime(p.createdAt)}</span>{/if}-->
        <!--                                {#if p.localisation}<span>{p.localisation}</span>{/if}-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </article>-->
        <!--                {/each}-->
        <!--            </div>-->
        <!--        </div>-->

        <div class="mt-12 grid grid-cols-1 gap-8 lg:grid-cols-[280px_minmax(0,1fr)_320px]">
            <!-- LEFT SIDEBAR (hidden on mobile) -->
            <aside class="hidden lg:block">
                <div class="sticky top-8 space-y-6">
                    <section class="rounded-2xl p-4 shadow-sm ring-1 ring-slate-200">
                        <!--                        <h2 class="text-base font-bold text-slate-900">Autres archives</h2>-->
                        <!--                        <ul class="mt-3 space-y-2 text-sm">-->
                        <!--                            <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2022</a></li>-->
                        <!--                            <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2023</a></li>-->
                        <!--                            <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2024</a></li>-->
                        <!--                            <li><a class="block rounded-md px-3 py-2 hover:bg-slate-50" href="#">2025</a></li>-->
                        <!--                        </ul>-->

                        <div class="mt-6">
                            <h3 class="text-sm font-extrabold text-slate-700">Latest News</h3>
                            <ul class="mt-3 space-y-4 hover:cursor-pointer">
                                {#each allThePosts.slice(0, 6) as n}
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
                {#each allThePosts as oneNews}
                    <article
                            class="overflow-hidden rounded-2xl shadow-sm ring-1 ring-slate-200"
                    >
                        <img
                                src={ publicEnv.PUBLIC_IMAGE_BASE_URL + oneNews.image.url}
                                alt="oneNews."
                                class="h-56 w-full object-cover sm:h-80"
                                loading="lazy"
                        />
                        <div class="space-y-2 p-5 sm:p-6">
                            <h3 class="text-base font-extrabold text-slate-900 sm:text-lg hover:cursor-pointer">
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
                                >Voir plus </a>
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
                    <section class="rounded-2xl p-4 shadow-sm ring-1 ring-slate-200">
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

    </div>
</section>
