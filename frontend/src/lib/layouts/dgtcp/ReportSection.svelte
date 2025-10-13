<!-- src/lib/sections/RapportsSection.svelte -->
<script lang="ts">
    import type {Rapport} from '$lib/types/Rapport';
    import folder_icon_400 from "$lib/assets/dgtcp/folder-icon-400.png";

    export let heading = "Rapports d'activités de la DGTCP";

    export let mReports: Rapport[] = []

    // Pagination demo props
    export let currentPage = 1;
    export let totalPages = 6;

    // const primaryBlue = "#1E66FF";
</script>

<section class="w-full bg-[#E6F4FA]">
    <div class="mx-auto max-w-[1200px] px-4 py-12 sm:py-14 md:py-16">
<!--         Heading-->
        <header class="text-center">
            <h2
                    class="font-extrabold tracking-tight text-[clamp(1.9rem,6vw,3.5rem)]
               leading-[1.05] text-[#1E66FF]"
            >
                {#each heading.split('\n') as line}
                    <span class="block">{line} </span>
                {/each}
            </h2>
            <div class="mx-auto mt-4 h-[2px] w-40 bg-[#c9d7ff] md:w-64"></div>
        </header>

        <!-- Cards grid -->
        <div
                class="mt-10 grid gap-8 md:grid-cols-2 lg:gap-10"
                role="list"
                aria-label="Rapports d’activité"
        >
            {#each mReports as singleReport (singleReport.id)}

                <article
                        role="listitem"
                        class="flex items-center gap-5 p-4 shadow-sm md:gap-6 md:p-6"
                >
                    <!-- Folder icon box -->
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

                    <!-- Text + actions -->
                    <div class="min-w-0 flex-1">
                        <h3 class="font-extrabold text-slate-900 text-lg md:text-xl line-clamp-2">
                            {singleReport.title}
                        </h3>
                        <p
                                class="mt-1 text-sm text-[#1b1b1b]/70 md:text-base line-clamp-2 "
                        >
                            {singleReport.description}
                        </p>
                        <p class="mt-1 text-sm text-[#1E66FF]/70">
                            {singleReport.createdAt}
                        </p>

                        <div class="mt-3 flex flex-wrap gap-3">
                            <button
                                    class="rounded-xl border-2 border-[#1E66FF] px-4 py-2 text-sm font-semibold text-[#1E66FF]
                       hover:bg-[#1E66FF]/5 active:scale-[.99] transition"
                                    on:click={() => dispatchEvent(new CustomEvent('download', { detail: singleReport.url }))}
                            >
                                Télécharger
                            </button>
                            <button
                                    class="rounded-xl border-2 border-[#1E66FF] px-4 py-2 text-sm font-semibold text-[#1E66FF]
                       hover:bg-[#1E66FF]/5 active:scale-[.99] transition"
                                    on:click={() => dispatchEvent(new CustomEvent('share', { detail: singleReport.url }))}
                            >
                                Partager
                            </button>
                        </div>
                    </div>
                </article>
            {/each}
        </div>

        <!-- Pagination -->
        <nav
                class="mt-10 flex justify-center"
                aria-label="Pagination des rapports"
        >
            <div
                    class="flex items-center gap-3 rounded-2xl border-2 border-[#1E66FF]
               px-5 py-3 shadow-sm"
            >
                <!-- Current page pill -->
                <span
                        class="grid h-9 w-9 place-items-center rounded-xl border-2 border-[#1E66FF]
                 text-base font-extrabold text-[#1E66FF] bg-white"
                        aria-current="page"
                >
          {currentPage}
        </span>

                <!-- Page numbers (demo static 2..5) -->
                {#each Array(Math.min(totalPages, 6)).fill(0).map((_, i) => i + 2) as n}
                    {#if n <= totalPages}
                        <button
                                class="text-base font-semibold text-[#1E66FF] hover:underline"
                                aria-label={"Aller à la page " + n}
                        >
                            {n}
                        </button>
                    {/if}
                {/each}

                <!-- Next arrow -->
                <button
                        class="ml-1 grid h-9 w-9 place-items-center rounded-xl border-2 border-[#1E66FF]
                 text-[#1E66FF] hover:bg-[#1E66FF]/5"
                        aria-label="Page suivante"
                >
                    <!-- simple chevron -->
                    <svg viewBox="0 0 24 24" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 6l6 6-6 6" />
                    </svg>
                </button>
            </div>
        </nav>
    </div>
</section>

