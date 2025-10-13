<!-- src/lib/sections/SiteFooter.svelte -->
<script lang="ts">

    import logo_dgtcp from '$lib/assets/dgtcp/logo-dgtcp-1000.png';
    // Contact & meta
    export let email = "secretariat-dg@dgtcp.cd";
    export let phone = "+243 812 345 890";
    export let addressLines: string[] = [
        "Notre adresse:",
        "14, Avenue Sergent Moke",
        "Concession Safricas",
        "Kinshasa - Gombe"
    ];
    export let siteCopy = "© Copyright  Dgtcp  2025";
    export let handle = "finance.dgtcp.cd";

    // Link columns
    export let aboutLinks = [
        { label: "Organigramme de la DGTCP", href: "#" },
        { label: "Rapport d’activité", href: "#" },
        { label: "Partenaires", href: "#" },
        { label: "Conditions d’utilisation", href: "#" },
        { label: "Termes de confidentialité", href: "#" }
    ];

    export let quickLinks = [
        { label: "Presidence", href: "#" },
        { label: "Primature", href: "#" },
        { label: "Senat", href: "#" },
        { label: "Budget", href: "#" }
    ];

    export let usefulLinks = [
        { label: "Ministere des finances", href: "#" },
        { label: "Portail de la Republique", href: "#" },
        { label: "Direction generale des impots", href: "#" },
        { label: "Fonction publique", href: "#" }
    ];

    // Socials
    export let socials = [
        { name: "Instagram", href: "#", icon: "instagram" },
        { name: "Facebook",  href: "#", icon: "facebook"  },
        { name: "WhatsApp",  href: "#", icon: "whatsapp"  }
    ];

    const navy = "#0F2B45";
    const blue = "#1E66FF";
</script>

<footer class="w-full bg-[#E6F4FA] text-[#{navy}]">
    <!-- thin divider like the mock -->
    <div class="h-[2px] w-full bg-slate-300/70"></div>

    <div class="mx-auto max-w-[1200px] px-5 py-10 sm:py-12 md:py-16">
        <!-- Top grid (mobile: stacked; md+: 4 columns) -->
        <div class="flex items-center gap-4">
            <img
                    src="{logo_dgtcp}"
                    alt="Trésor Public — Comptabilité"
                    class="h-25 rounded-full object-contain sm:h-18"
                    loading="lazy"
                    decoding="async"
            />
        </div>
        <div class="grid gap-10 grid-cols-2 md:grid-cols-4 mt-8">
            <!-- Brand + contacts (col 1) -->
            <div>
                <!-- Mobile-only section title "Contacts" (per mock) -->
                <h3 class="text-2xl font-extrabold text-[#0D2A4A]">Contacts</h3>

                <!-- Contacts -->
                <address class="not-italic space-y-2  text-[#0D2A4A] text-sm mt-4">
                    {#each addressLines as line }
                        <p>{line}</p>
                    {/each}
                    <p class="">{email}</p>
                    <p>{phone}</p>
                </address>
            </div>

            <!-- A propos -->
            <nav aria-label="À propos">
                <h3 class="text-2xl font-extrabold text-[#0D2A4A]">A propos</h3>
                <ul class=" space-y-3 text-sm text-[#0D2A4A] mt-4">
                    {#each aboutLinks as l}
                        <li class="list-disc pl-4 marker:text-[#0D2A4A]">
                            <a class="hover:text-[#{blue}]" href={l.href}>{l.label}</a>
                        </li>
                    {/each}
                </ul>
            </nav>

            <!-- Accés Rapide -->
            <nav aria-label="Accés Rapide">
                <h3 class="text-2xl font-extrabold text-[#0D2A4A]">Accés Rapide</h3>
                <ul class="text-sm space-y-3  text-[#0D2A4A] mt-4">
                    {#each quickLinks as l}
                        <li class="list-disc pl-4 marker:text-[#0D2A4A]">
                            <a class="hover:text-[#{blue}]" href={l.href}>{l.label}</a>
                        </li>
                    {/each}
                </ul>
            </nav>

            <!-- Liens utiles -->
            <nav aria-label="Liens utiles">
                <h3 class="text-2xl font-extrabold text-[#0D2A4A]">Liens utiles</h3>
                <ul class="text-sm space-y-3 text-[#0D2A4A] mt-4">
                    {#each usefulLinks as l}
                        <li class="list-disc pl-4 marker:text-[#0D2A4A]">
                            <a class="hover:text-[#{blue}]" href={l.href} target="_blank" rel="noreferrer">{l.label}</a>
                        </li>
                    {/each}
                </ul>
            </nav>
        </div>

        <!-- Bottom bar -->
        <div
                class="mt-10 flex flex-col items-center justify-between gap-5 border-t border-slate-300/70 pt-6 text-[#0D2A4A]
             md:flex-row"
        >
            <p class="text-[15px]">{siteCopy}</p>

            <div class="flex items-center gap-4">
                <!-- Social icons -->
                {#each socials as s}
                    <a
                            class="grid h-9 w-9 place-items-center text-[#0D2A4A] hover:text-[#1E66FF]"
                            href={s.href}
                            aria-label={s.name}
                            target="_blank"
                            rel="noreferrer"
                    >
                        {#if s.icon === "instagram"}
                            <svg viewBox="0 0 24 24" class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="3" width="18" height="18" rx="5"></rect>
                                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                <line x1="17.5" y1="6.5" x2="17.5" y2="6.5"></line>
                            </svg>
                        {:else if s.icon === "facebook"}
                            <svg viewBox="0 0 24 24" class="h-6 w-6" fill="currentColor">
                                <path d="M13 22v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3V2h-3a5 5 0 0 0-5 5v3H6v4h3v8h4z"/>
                            </svg>
                        {:else if s.icon === "whatsapp"}
                            <svg viewBox="0 0 24 24" class="h-6 w-6" fill="currentColor">
                                <path d="M.5 23.5 3.2 19A10 10 0 1 1 19 20.8L23.5 23.5 20.8 19A10 10 0 1 1 3.2 19z" fill="none"></path>
                                <path d="M20 12a8 8 0 1 0-14.8 4.6L4 20l3.5-1.1A8 8 0 0 0 20 12zm-9.3-2.9c-.2-.5-.4-.5-.6-.5h-.5c-.2 0-.5.1-.7.3-.2.2-.9.8-.9 2s1 2.3 1.1 2.5c.1.2 2 3.2 4.8 4.4.7.3 1.2.4 1.6.4.7 0 1.4-.3 1.6-.8.2-.5.2-1 .1-1.1-.1-.2-.2-.2-.5-.4s-1.4-.7-1.6-.8-.4-.1-.6.1c-.2.2-.7.8-.8 1-.2.2-.4.2-.6.1-.2-.1-1-.4-1.9-1.2a7 7 0 0 1-1.3-1.6c-.1-.2 0-.4.1-.5.1-.1.2-.3.3-.4.1-.1.1-.3.2-.5.1-.2 0-.4 0-.5 0-.1-.6-1.5-.8-2z"/>
                            </svg>
                        {/if}
                    </a>
                {/each}

                <!-- Right label -->
                <span class="ml-1 text-[17px] font-semibold text-[#0D2A4A]">{handle}</span>
            </div>
        </div>
    </div>
</footer>

<style>
    /* No extra CSS; Tailwind handles layout & spacing. */
</style>
