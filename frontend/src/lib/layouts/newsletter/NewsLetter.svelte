<script lang="ts">
    // Parent can pass a callback: <NewsletterSubscribe onSubscribe={(email)=>...} />
    export let onSubscribe: (email: string) => void | Promise<void> = () => {
    };

    let email = "";
    let loading = false;
    let message = "";

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/i;

    async function onSubmit(e: Event) {
        e.preventDefault();
        message = "";
        if (!emailRegex.test(email)) {
            message = "Veuillez entrer un e-mail valide.";
            return;
        }
        loading = true;
        try {
            await onSubscribe(email);        // <-- call the prop
            message = "Merci ! Vérifiez votre boîte mail.";
            email = "";
        } catch {
            message = "Une erreur est survenue. Réessayez.";
        } finally {
            loading = false;
        }
    }
</script>

<section class="w-full bg-[#E6F4FA]">
    <div class="mx-auto max-w-4xl px-4 py-12 sm:py-16 pb-25">
        <h2 class="text-center text-2xl font-extrabold text-blue-700 sm:text-4xl">
            S’abonner à notre infolettre
        </h2>

        <form
                class="mx-auto mt-6 flex w-full max-w-xl items-stretch rounded-full bg-[#E6F4FA] p-1 shadow-sm ring-2 ring-blue-500/70 backdrop-blur"
                on:submit|preventDefault={onSubmit}
        >
            <label class="sr-only" for="newsletter-email">Adresse e-mail</label>
            <input
                    aria-invalid={message ? "true" : "false"}
                    autocomplete="email"
                    bind:value={email}
                    class="min-w-0 flex-1 bg-[#E6F4FA] rounded-full border-0 px-5 py-4 text-lg font-semibold text-slate-700 placeholder:text-slate-400 focus:outline-none focus:ring-0"
                    id="newsletter-email"
                    placeholder="votrenom@gmail.com"
                    required
                    type="email"
            />
            <button
                    class="hover:pointer ml-2 inline-flex items-center justify-center rounded-full px-6 py-4 text-lg font-extrabold text-white transition focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 disabled:opacity-60 bg-gradient-to-r from-blue-600 to-sky-500"
                    disabled={loading}
                    type="submit"
            >
                {#if loading}
                    <svg class="mr-2 h-5 w-5 animate-spin" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="10" stroke="white" stroke-opacity="0.3" stroke-width="4"/>
                        <path d="M22 12a10 10 0 0 1-10 10" stroke="white" stroke-width="4"/>
                    </svg>
                {/if}
                Souscrire
            </button>
        </form>

        {#if message}
            <p class="mx-auto mt-3 max-w-3xl text-center text-sm font-medium text-slate-600">
                {message}
            </p>
        {/if}
    </div>
</section>
