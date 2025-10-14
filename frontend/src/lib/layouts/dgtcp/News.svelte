<!-- src/lib/sections/NewsSection.svelte -->
<script lang="ts">

    import news_one from "$lib/assets/dgtcp/news-one.jpg";
    import welcome from "$lib/assets/dgtcp/welcome.jpg";
    import news_secondary from "$lib/assets/dgtcp/news-secondary.jpg";
    import type {Annonce} from "$lib/types/Annonce";
    import {fullDate, shortDate, shortTime} from "$lib/utils/genericUtils";
    import {env as publicEnv} from "$env/dynamic/public";

    export let heading = "Annonces et actualités";

    // Featured article (center)
    export let featured: Annonce
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
            <div class="mx-auto mt-4 flex h-1.5 w-44 overflow-hidden rounded-full sm:w-52">
                <div class="h-full w-1/3 bg-[#1d5ed6]"></div>
                <div class="h-full w-1/3 bg-[#F2DE00]"></div>
                <div class="h-full w-1/3 bg-[#ff1e1e]"></div>
            </div>
        </header>

        <!-- Layout: 1 col on mobile -> 3 cols on md+ -->
        <div
                class="mt-10 grid gap-8 md:[grid-template-columns:320px_minmax(0,1fr)_320px]"
        >
            <!-- Left list -->
            <div class="space-y-6">
                {#each leftPosts as p, i (p.id)}
                    <article
                            class="grid grid-cols-[112px_1fr] gap-3 border-b border-slate-300/40 pb-5 last:border-none"
                    >
                        <img
                                src={news_secondary}
                                alt={p.image.url}
                                class="h-24 w-28 rounded object-cover"
                                loading="lazy"
                                decoding="async"
                        />

                        <div class="min-w-0">
                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">
                                {p.headline}
                            </h3>
                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-2">
                                {p.subheadline}
                            </p>

                            <div class="mt-2 flex items-center gap-3 text-[12px] text-slate-500">
                                <span>{shortDate(p.createdAt)}</span>
                                {#if p.createdAt}<span>{shortTime(p.createdAt)}</span>{/if}
                                {#if p.localisation}<span>{p.localisation}</span>{/if}

                                <!-- tiny share icon (red) -->
                                <svg
                                        class="ml-auto h-3.5 w-3.5 text-[#e22b2b]"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2.3"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        aria-hidden="true"
                                >
                                    <path d="M4 12v7a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-7"/>
                                    <path d="M16 6l-4-4-4 4"/>
                                    <path d="M12 2v14"/>
                                </svg>
                            </div>
                        </div>
                    </article>
                {/each}
            </div>

            <!-- Featured (center) -->
            <article
                    class="rounded-2xl border-1 border-[#AABCD1] shadow-sm"
            >
                <!-- Image -->
                <img
                        alt={featured.id}
                        class="h-56 w-full rounded-t-2xl object-cover sm:h-64 md:h-72"
                        decoding="async"
                        loading="eager"
                        src={ publicEnv.PUBLIC_IMAGE_BASE_URL + featured.image.url}
                />

                <!-- Body -->
                <div class="p-5 sm:p-6 md:p-7 text-center">
                    <h3 class="text-xl font-extrabold text-slate-900 sm:text-2xl">
                        {featured.headline}
                    </h3>

                    <p
                            class="mx-auto mt-2 max-w-[70ch] text-base text-slate-700
                   sm:text-lg md:text-xl"
                    >
                        {featured.subheadline}
                    </p>

                    <p class="mt-3 text-sm font-medium text-slate-500">
                        {fullDate(featured.createdAt)}
                    </p>

                    <div class="mt-5 flex justify-center gap-4">
                        <button
                                class="rounded-xl border-2 border-[#1E66FF] px-6 py-3 text-sm font-semibold text-[#1E66FF]
                     hover:bg-[#1E66FF]/5 active:scale-[.99] transition"
                        >
                            Voir plus
                        </button>
                        <button
                                class="rounded-xl border-2 border-[#1E66FF] px-6 py-3 text-sm font-semibold text-[#1E66FF]
                     hover:bg-[#1E66FF]/5 active:scale-[.99] transition"
                        >
                            Partager
                        </button>
                    </div>
                </div>

                <div>
                    <!-- Optional second image (as in mobile mock) -->
                    <img
                            alt="Illustration complémentaire"
                            class="px-5 mb-5 rounded-2xl object-cover  md:mb-6 object-contain"
                            decoding="async"
                            loading="lazy"
                            src={publicEnv.PUBLIC_IMAGE_BASE_URL + featured.image.url}
                    />
                </div>
            </article>

            <!-- Right list -->
            <div class="space-y-6">
                {#each rightPosts as p (p.id)}
                    <article
                            class="grid grid-cols-[112px_1fr] gap-3 border-b border-slate-300/40 pb-5 last:border-none"
                    >
                        <img
                                src={news_secondary}
                                alt={p.image.url}
                                class="h-24 w-28 rounded object-contain"
                                loading="lazy"
                                decoding="async"
                        />

                        <div class="min-w-0">
                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">
                                {p.headline}
                            </h3>
                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-4 md:line-clamp-6">
                                {p.subheadline}
                            </p>

                            <div class="mt-2 border-t border-slate-300/40 pt-2 text-[12px] text-slate-500">
                                <span>{shortDate(p.createdAt)}</span>
                                {#if p.createdAt}<span class="mx-2">{shortTime(p.createdAt)}</span>{/if}
                                {#if p.localisation}<span>{p.localisation}</span>{/if}
                            </div>
                        </div>
                    </article>
                {/each}
            </div>
        </div>
    </div>
</section>
