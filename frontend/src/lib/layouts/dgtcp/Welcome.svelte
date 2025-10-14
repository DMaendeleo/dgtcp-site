<!-- src/lib/sections/HeroDGTC.svelte -->
<script lang="ts">

    import welcome from '$lib/assets/dgtcp/welcome.jpg';
    import home_mobile from '$lib/assets/dgtcp/home_mobile.jpg';
    import welcome_800 from '$lib/assets/dgtcp/welcome-800.jpg';

    export let title: string = "Direction générale du trésor\net de la comptabilité publique";
    export let subtitle: string =

        "Situation des dépenses publiques exécutées en procédure d'urgence pour la période \n"

    // Backgrounds: mobile first
    // export let imageMobile = "/images/hero-dgtc-mobile.jpg";
    // export let imageDesktop = "/images/hero-dgtc-desktop.jpg";

    // Optional: how many pager dots & which one is active
    export let slides = 5;
    export let active = 3; // 1-based index
</script>

<section class="relative isolate w-full">
    <!-- Top tricolor bar -->
    <!--    <div class="flex h-2 w-full">-->
    <!--        <div class="h-full w-1/3 bg-[#0054FF]" aria-hidden="true"></div>-->
    <!--        <div class="h-full w-1/3 bg-[#ffe100]" aria-hidden="true"></div>-->
    <!--        <div class="h-full w-1/3 bg-[#ff1e1e]" aria-hidden="true"></div>-->
    <!--    </div>-->

    <!-- Background image (mobile first) -->
    <div class="relative h-[60vh] min-h-[420px] md:h-[70vh] lg:h-[80vh] max-h-[700px]">
        <picture>
            <source media="(min-width: 1024px)" srcset="{welcome_800}"/>
            <img
                    alt="Réunion officielle – Direction générale du trésor"
                    class="absolute inset-0 h-full w-full object-cover"
                    decoding="async"
                    loading="eager"
                    src="{welcome_800}"
            />

            <!-- Dark overlay for readability -->
            <!--        <div class="absolute inset-0 bg-black/40 md:bg-black/35 lg:bg-black/30"></div>-->

            <!-- Content (mobile first) -->
            <div
                    class="relative z-10 mx-auto flex h-full w-full max-w-[1200px]  px-4 pb-8 sm:px-6 md:px-8 lg:pb-10 items-end justify-center text-center"
            >
                <div class="text-white drop-shadow-[0_2px_8px_rgba(0,0,0,0.4)]">
                    <!-- Headline -->
                    <h1
                            class="font-extrabold leading-tight tracking-tight
                 text-[clamp(1.5rem,6vw,2.75rem)] sm:text-5xl md:text-6xl lg:text-7xl text-[#F2DE00]"
                    >
                        {#each title.split('\n') as line, i}
                            <span class="block">{line}</span>
                        {/each}
                    </h1>

                    <!-- Subhead -->

                    <!-- Mobile version (3 lines) -->
                    <p
                            class="mt-4 max-w-[68ch] text-base leading-relaxed sm:text-lg md:text-xl md:hidden lg:text-2xl text-[#C2DBFF]"
                    >
                        {#each subtitle.split('\n') as line}
                            <span class="block">{line}</span>
                        {/each}
                    </p>
                    <!-- Desktop version (2 lines) -->
                    <p
                            class="mt-4 hidden text-base leading-relaxed sm:text-lg md:block
         max-w-[68ch] lg:text-2xl text-[#C2DBFF]"
                    >
                        Situation des dépenses publiques exécutées en procédure d'urgence
                        pour la période
                    </p>
                    <!-- Pager dots -->
                    <div aria-label="Diapos" class="mt-6 flex gap-2 justify-center text-center" role="tablist">
                        {#each Array(slides) as _, i (i)}
                            <button
                                    class="h-2.5 w-2.5 rounded-full transition
                     {i + 1 === active
                       ? 'bg-white'
                       : 'bg-white/50 hover:bg-white/80'}"
                                    aria-label={"Diapo " + (i + 1)}
                                    aria-selected={i + 1 === active}
                            />
                        {/each}
                    </div>
                </div>
            </div>

            <!-- Subtle bottom fade to page background -->
            <div class="pointer-events-none absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-[#0a0a0a] to-transparent"></div>
    </div>
</section>

<style>
    /* No extra CSS required; Tailwind handles everything. */
</style>
