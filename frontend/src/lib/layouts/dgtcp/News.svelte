<!-- src/lib/sections/NewsSection.svelte -->
<script lang="ts">

    import news_one from "$lib/assets/dgtcp/news-one.jpg";
    import welcome from "$lib/assets/dgtcp/welcome.jpg";
    import news_secondary from "$lib/assets/dgtcp/news-secondary.jpg";


    type Post = {
        id: string;
        title: string;
        excerpt: string;
        date: string;     // e.g. "September, 21 2025"
        time?: string;    // e.g. "14:02"
        location?: string;// e.g. "Kinshasa"
        // image: string;
    };

    export let heading = "Annonces et actualités";

    // Featured article (center)
    export let featured: Post = {
        id: "feat-1",
        title: "Activité de la DGTCP, Avril à septembre 2025",
        excerpt:
            "Mise en œuvre opérationnelle de la politique et régie budgétaire en termes de la réforme à la DGTCP",
        date: "September, 21 2025",
        // image: "$lib/assets/news-one.jpg",
    };

    // Side lists
    export let leftPosts: Post[] = [
        {
            id: "l1",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes Lorem ipsum dolor sit amet…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-1.jpg",
        },
        {
            id: "l2",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-2.jpg",
        },
        {
            id: "l3",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-3.jpg",
        },
        {
            id: "l4",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes Lorem ipsum dolor sit amet…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-1.jpg",
        },
    ];

    export let rightPosts: Post[] = [
        {
            id: "r1",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-4.jpg",
        },
        {
            id: "r2",
            title:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            excerpt:
                "Mise en œuvre opérationnelle de la politique budgétaire en termes…",
            date: "September, 21 2025",
            time: "14:02",
            location: "Kinshasa",
            image: "/images/news/thumb-5.jpg",
        },
    ];

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
                                alt={p.title}
                                class="h-24 w-28 rounded object-cover"
                                loading="lazy"
                                decoding="async"
                        />

                        <div class="min-w-0">
                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">
                                {p.title}
                            </h3>
                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-2">
                                {p.excerpt}
                            </p>

                            <div class="mt-2 flex items-center gap-3 text-[12px] text-slate-500">
                                <span>{p.date}</span>
                                {#if p.time}<span>{p.time}</span>{/if}
                                {#if p.location}<span>{p.location}</span>{/if}

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
                                    <path d="M4 12v7a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-7" />
                                    <path d="M16 6l-4-4-4 4" />
                                    <path d="M12 2v14" />
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
                        src={news_one}
                        alt={featured.title}
                        class="h-56 w-full rounded-t-2xl object-cover sm:h-64 md:h-72"
                        loading="eager"
                        decoding="async"
                />

                <!-- Body -->
                <div class="p-5 sm:p-6 md:p-7 text-center">
                    <h3 class="text-xl font-extrabold text-slate-900 sm:text-2xl">
                        {featured.title}
                    </h3>

                    <p
                            class="mx-auto mt-2 max-w-[70ch] text-base text-slate-700
                   sm:text-lg md:text-xl"
                    >
                        {featured.excerpt}
                    </p>

                    <p class="mt-3 text-sm font-medium text-slate-500">
                        {featured.date}
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
                        src={news_secondary}
                        alt="Illustration complémentaire"
                        class="px-5 mb-5 rounded-2xl object-cover  md:mb-6 object-contain"
                        loading="lazy"
                        decoding="async"
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
                                alt={p.title}
                                class="h-24 w-28 rounded object-contain"
                                loading="lazy"
                                decoding="async"
                        />

                        <div class="min-w-0">
                            <h3 class="text-[15px] font-semibold text-slate-800 line-clamp-2">
                                {p.title}
                            </h3>
                            <p class="mt-1 text-[13px] text-slate-600 line-clamp-4 md:line-clamp-6">
                                {p.excerpt}
                            </p>

                            <div class="mt-2 border-t border-slate-300/40 pt-2 text-[12px] text-slate-500">
                                <span>{p.date}</span>
                                {#if p.time}<span class="mx-2">{p.time}</span>{/if}
                                {#if p.location}<span>{p.location}</span>{/if}
                            </div>
                        </div>
                    </article>
                {/each}
            </div>
        </div>
    </div>
</section>
