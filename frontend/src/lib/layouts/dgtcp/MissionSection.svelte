<!-- src/lib/sections/MissionSection.svelte -->
<script lang="ts">
    import logo_mission from '$lib/assets/dgtcp/logo-mission.jpg';
    export const logo = "/images/dgtcp-logo.png";
    export const title =
        "Mission principale\nde la DGTCP"; // use \n for the desired line break
    export let description =
        "Mise en œuvre opérationnelle de la politique budgétaire en termes " +
        "d'exécution des dépenses et de suivi des recettes perçues par les " +
        "administrations financières";
</script>

<section class="w-full bg-[#E6F4FA]">
    <div class="mx-auto max-w-[1100px] px-4 py-10 sm:py-12 md:py-16 lg:py-20 text-center">
        <!-- Logo -->
        <img
                src="{logo_mission}"
                alt="Logo du Trésor Public"
                class="mx-auto h-16 w-16 sm:h-20 sm:w-20 md:h-24 md:w-24 rounded-full object-contain"
                loading="lazy"
                decoding="async"
        />

        <!-- Title -->
        <h2
                class="mt-6 font-extrabold leading-tight tracking-tight text-[#1E66FF]
             text-[clamp(1.75rem,6vw,2.75rem)] sm:text-4xl md:text-5xl lg:text-6xl"
        >
            {#each title.split('\n') as line}
                <span class="block">{line}</span>
            {/each}
        </h2>

        <!-- Description -->
        <p
                class="mx-auto mt-8 max-w-[1000px]
         text-[clamp(1rem,2.8vw,1.25rem)] leading-relaxed
         text-neutral-900/90 text-xl md:text-3xl
         md:line-clamp-3"
        >
            {description}
        </p>


        <!-- Tricolor underline -->
        <div class="mx-auto mt-8 flex h-1.5 w-56 overflow-hidden rounded-full sm:w-64 md:w-72">
            <div class="h-full w-1/3 bg-[#0054FF]" aria-hidden="true"></div>
            <div class="h-full w-1/3 bg-[#F2DE00]" aria-hidden="true"></div>
            <div class="h-full w-1/3 bg-[#ff1e1e]" aria-hidden="true"></div>
        </div>
    </div>
</section>
