<!-- HeroAnnonce.svelte -->
<script lang="ts">

    import hero_financier from '$lib/assets/dgtcp/hero_financier_fine_90.jpg';
    import welcome from "$lib/assets/dgtcp/welcome.jpg";
    import welcome_800 from "$lib/assets/dgtcp/welcome-800.jpg";

    export let title: string = "Annonces et\n Activités à la DGTCP";

</script>

<section class="relative isolate w-full">
    <!-- Background image (mobile first) -->
    <div class="relative h-[72vh] min-h-[320px] md:h-[68vh] lg:h-[76vh] max-h-[500px]">
        <picture>
            <source media="(min-width: 1024px)" srcset="{hero_financier}"/>
            <img
                    alt="Réunion officielle – Direction générale du trésor"
                    class="absolute inset-0 h-full w-full object-cover"
                    decoding="async"
                    loading="eager"
                    src="{hero_financier}"
            />
        </picture>

        <!-- Dark overlay for readability -->
        <!--        <div class="absolute inset-0 bg-black/40 md:bg-black/35 lg:bg-black/30"></div>-->

        <!-- Content (mobile first) -->
        <div
                class="relative z-10 mx-auto flex h-full w-full max-w-[1200px]  px-4 pb-8 sm:px-6 md:px-8 lg:pb-10 items-center pt-30 md:pt-0  md:items-end justify-center text-center"
        >
            <div class="text-white drop-shadow-[0_2px_8px_rgba(0,0,0,0.4)]">
                <!-- Headline -->
                <h1
                        class="font-extrabold leading-tight tracking-tight
                 text-[clamp(2rem,6vw,2.75rem)] sm:text-5.5xl md:text-6xl lg:text-7xl text-[#F2DE00]"
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
                    Resumé des activités publiques tenues par la DGTCP <br/>
                    Communiqués de presses et Declaration du ministère de finances
                </p>
                <!-- Desktop version (2 lines) -->
                <p
                        class="mt-4 hidden text-base leading-relaxed sm:text-lg md:block
         max-w-[68ch] lg:text-2xl text-[#C2DBFF]"
                >
                    Resumé des activités publiques tenues par la DGTCP <br/>
                    Communiqués de presses et Declaration du ministère de finances
                </p>
            </div>
        </div>

        <!-- Subtle bottom fade to page background -->
        <div class="pointer-events-none absolute inset-x-0 bottom-0 h-24 bg-gradient-to-t from-[#0a0a0a] to-transparent"></div>
    </div>
</section>

<!--<section class="relative w-full overflow-hidden">-->
<!--    &lt;!&ndash; Background image &ndash;&gt;-->
<!--    <img-->
<!--            src={hero_financier}-->
<!--            alt="Centre Financier de Kinshasa - DGTP"-->
<!--            class="h-[55vh] w-full object-cover sm:h-[45vh] md:h-[40vh] lg:h-[30vh]"-->
<!--            loading="eager"-->
<!--            decoding="async"-->
<!--    />-->

<!--    &lt;!&ndash; Content &ndash;&gt;-->
<!--    <div class="absolute inset-0">-->
<!--        <div class="mx-auto flex h-full max-w-6xl items-center px-4 sm:px-6 lg:px-8">-->
<!--            <div class="w-full text-center justify-center">-->
<!--                <h1-->
<!--                        class="font-extrabold leading-tight tracking-tight-->
<!--                 text-[clamp(1.5rem,6vw,2.75rem)] sm:text-4.5xl md:text-6xl lg:text-7xl text-[#F2DE00]"-->
<!--                >-->
<!--                    Annonces et activités<br class="hidden sm:block" />-->
<!--                    <span class="sm:whitespace-nowrap">à la DGTCP</span>-->
<!--                </h1>-->

<!--                &lt;!&ndash; Divider (optional) &ndash;&gt;-->
<!--                <div class="mx-auto mt-4 h-[2px] w-24 bg-white/70 md:mx-0 md:w-40"></div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->

<!--    &lt;!&ndash; Subtle bottom fade for readability on content below (optional) &ndash;&gt;-->
<!--    <div class="pointer-events-none absolute inset-x-0 bottom-0 h-16 bg-gradient-to-t from-black/40 to-transparent"></div>-->
<!--</section>-->
