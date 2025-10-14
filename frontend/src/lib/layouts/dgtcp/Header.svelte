<script>
    let isOpen = false;
    import logo_dgtcp from '$lib/assets/dgtcp/logo-dgtcp-1000.png';
    import logo_finance from '$lib/assets/dgtcp/logo-finance-1000.png';
    // import hamburger from '$lib/assets/hamburger-1000.png';
    const navy = "#0F2B45";
    const blue = "#1E66FF";
</script>

<header class="bg-sky-50 ">
    <div class="max-w-screen-xl mx-auto ">
        <!-- Top bar with logos -->
        <div class="flex items-center justify-between px-4 py-3 md:py-4">
            <!-- Left logos (stacked on mobile) -->
            <div class="flex items-center sm:space-x-15 space-x-7">
                <a class="block" href="/">
                    <img alt="Logo 1" class="md:h-12 lg:h-16 h-10 w-auto" src={logo_dgtcp}/>
                </a>
                <img alt="Logo 2" class="hidden md:h-12 lg:h-16 xs:block h-10 w-auto" src={logo_finance}/>
                <!--            <img src={hamburger} alt="Logo 3" class="h-10 w-auto hidden md:block" />-->
            </div>
            <!-- Mobile menu button -->
            <button
                    aria-label="Menu"
                    class="md:hidden p-2 rounded focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-600"
                    on:click={() => (isOpen = !isOpen)}>
                <!--            <svg-->
                <!--                    class="h-8 w-8 text-blue-900"-->
                <!--                    fill="none"-->
                <!--                    stroke="currentColor"-->
                <!--                    viewBox="0 0 24 24"-->
                <!--                    xmlns="http://www.w3.org/2000/svg"-->
                <!--            >-->
                <!--                <path-->
                <!--                        stroke-linecap="round"-->
                <!--                        stroke-linejoin="round"-->
                <!--                        stroke-width="2"-->
                <!--                        d="M4 6h16M4 12h16M4 18h16"-->
                <!--                ></path>-->
                <!--            </svg>-->
                <svg
                        class="h-12 w-10"
                        id="vector"
                        viewBox="0 0 48 48"
                        xmlns="http://www.w3.org/2000/svg">
                    <g id="group_1">
                        <path
                                d="M 39.05 46.84 L 9.29 46.84 C 7.225 46.84 5.242 46.019 3.782 44.558 C 2.321 43.098 1.5 41.115 1.5 39.05 L 1.5 9.29 C 1.5 7.225 2.321 5.242 3.782 3.782 C 5.242 2.321 7.225 1.5 9.29 1.5 L 39.05 1.5 C 41.115 1.5 43.098 2.321 44.558 3.782 C 46.019 5.242 46.84 7.225 46.84 9.29 L 46.84 39.05 C 46.84 41.115 46.019 43.098 44.558 44.558 C 43.098 46.019 41.115 46.84 39.05 46.84"
                                fill="none"
                                id="path"
                                stroke="#001c49"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-miterlimit="10"
                                stroke-width="3"/>
                        <g id="group">
                            <path
                                    d="M 9.65 14.59 L 38.68 14.59 C 38.874 14.59 39.059 14.667 39.196 14.804 C 39.333 14.941 39.41 15.126 39.41 15.32 L 39.41 17.02 C 39.41 17.214 39.333 17.399 39.196 17.536 C 39.059 17.673 38.874 17.75 38.68 17.75 L 9.65 17.75 C 9.456 17.75 9.271 17.673 9.134 17.536 C 8.997 17.399 8.92 17.214 8.92 17.02 L 8.92 15.32 C 8.92 15.126 8.997 14.941 9.134 14.804 C 9.271 14.667 9.456 14.59 9.65 14.59 M 9.65 22.59 L 38.68 22.59 C 38.874 22.59 39.059 22.667 39.196 22.804 C 39.333 22.941 39.41 23.126 39.41 23.32 L 39.41 25.02 C 39.41 25.214 39.333 25.399 39.196 25.536 C 39.059 25.673 38.874 25.75 38.68 25.75 L 9.65 25.75 C 9.456 25.75 9.271 25.673 9.134 25.536 C 8.997 25.399 8.92 25.214 8.92 25.02 L 8.92 23.32 C 8.92 23.126 8.997 22.941 9.134 22.804 C 9.271 22.667 9.456 22.59 9.65 22.59 M 9.65 30.59 L 38.68 30.59 C 38.874 30.59 39.059 30.667 39.196 30.804 C 39.333 30.941 39.41 31.126 39.41 31.32 L 39.41 33.02 C 39.41 33.214 39.333 33.399 39.196 33.536 C 39.059 33.673 38.874 33.75 38.68 33.75 L 9.65 33.75 C 9.456 33.75 9.271 33.673 9.134 33.536 C 8.997 33.399 8.92 33.214 8.92 33.02 L 8.92 31.32 C 8.92 31.192 8.954 31.066 9.018 30.955 C 9.082 30.844 9.174 30.752 9.285 30.688 C 9.396 30.624 9.522 30.59 9.65 30.59"
                                    fill="#001c49"
                                    id="path_1"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"/>
                        </g>
                    </g>
                </svg>

            </button>

            <!-- Desktop Nav -->
            <nav class="hidden md:flex items-center space-x-4 md:text-xs lg:text-sm text-xs">
                <a class="border-b-4 border-transparent font-bold hover:border-[#1E66FF] hover:text-[#1E66FF] transition"
                   href="/">Accueil</a>
                <a class="hover:text-[#1E66FF] border-b-4 border-transparent font-bold transition" href="/">A propos</a>
                <a class="hover:text-[#1E66FF] border-b-4 border-transparent font-bold transition" href="/rapports">Rapports</a>
                <a class="hover:text-[#1E66FF] border-b-4 border-transparent font-bold transition" href="/annonces">Actualités</a>
                <a class="hover:text-[#1E66FF] border-b-4 border-transparent font-bold transition" href="/">Contacts</a>
                <button class="text-black">
                    <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                                d="M21 21l-4.35-4.35M17 10a7 7 0 11-14 0 7 7 0 0114 0z"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="3"
                        />
                    </svg>
                </button>
            </nav>
        </div>

        <!-- Color strip under header -->
        <!--    <div class="h-1 w-full flex">-->
        <!--        <div class="flex-1 bg-blue-600"></div>-->
        <!--        <div class="flex-1 bg-yellow-400"></div>-->
        <!--        <div class="flex-1 bg-red-600"></div>-->
        <!--    </div>-->

        <!-- Mobile Menu -->
        {#if isOpen}
            <nav class="lg:hidden bg-sky-50 px-4 py-3 space-y-2">
                <a href="/" class="block">Accueil</a>
                <a href="/" class="block">A propos</a>
                <a href="/rapports" class="block">Rapports</a>
                <a href="/annonces" class="block">Actualités</a>
                <a href="/" class="block">Contacts</a>
                <button class="text-blue-900">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M21 21l-4.35-4.35M17 10a7 7 0 11-14 0 7 7 0 0114 0z"
                        />
                    </svg>
                </button>
            </nav>
        {/if}
    </div>
    <div class="flex h-2 w-full">
        <div aria-hidden="true" class="h-full w-1/3 bg-[#0054FF]"></div>
        <div aria-hidden="true" class="h-full w-1/3 bg-[#ffe100]"></div>
        <div aria-hidden="true" class="h-full w-1/3 bg-[#ff1e1e]"></div>
    </div>
</header>
