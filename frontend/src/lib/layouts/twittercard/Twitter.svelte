<script lang="ts">
    export let authorName = "Account";
    export let handle = "@username";
    export let avatarUrl =
        "https://avatars.githubusercontent.com/u/9919?s=200&v=4";
    export let verified = false;
    export let timeAgo = "15m";
    export let text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.";
    export let imageUrl: string | null =
        "https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=1600&auto=format&fit=crop";
    export let replies = 12;
    export let reposts = 34;
    export let likes = 210;
</script>

<article
        class="w-full max-w-xl overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200"
        role="article"
        aria-label="Post"
>
    <!-- Header -->
    <header class="flex items-start gap-3 p-4">
        <img
                src={avatarUrl}
                alt=""
                class="h-10 w-10 flex-none rounded-full ring-1 ring-slate-200 object-cover"
                loading="lazy"
        />
        <div class="min-w-0 flex-1">
            <div class="flex flex-wrap items-center gap-x-2 text-sm">
                <span class="font-semibold text-slate-900">{authorName}</span>
                {#if verified}
                    <svg
                            class="h-4 w-4 text-sky-500"
                            viewBox="0 0 24 24"
                            fill="currentColor"
                            aria-label="Verified"
                    >
                        <path
                                d="M12 2l2.39 4.84L20 8l-3.8 3.7L17.8 18l-5.8-3.05L6.2 18l1.6-6.3L4 8l5.61-1.16L12 2z"
                        />
                    </svg>
                {/if}
                <span class="truncate text-slate-500">{handle}</span>
                <span class="text-slate-400">· {timeAgo}</span>
            </div>
        </div>
        <!-- X logo (dummy) -->
        <svg class="h-5 w-5 text-slate-400" viewBox="0 0 24 24" aria-hidden="true">
            <path
                    fill="currentColor"
                    d="M18.9 3H22l-8.2 9.4L22.7 21H16l-5.1-6.1L5 21H2l8.8-10.1L1.5 3H8l4.6 5.5L18.9 3z"
            />
        </svg>
    </header>

    <!-- Body -->
    <div class="px-4 pb-3 text-[15px] leading-6 text-slate-800">
        {text}
    </div>

    {#if imageUrl}
        <div class="px-4 pb-4">
            <img
                    src={imageUrl}
                    alt=""
                    class="max-h-80 w-full rounded-xl object-cover ring-1 ring-slate-200"
                    loading="lazy"
            />
        </div>
    {/if}

    <!-- Actions -->
    <footer class="flex items-center justify-between px-2 py-2 text-sm">
        <button
                class="flex items-center gap-2 rounded-xl px-3 py-2 text-slate-600 hover:bg-slate-50"
                aria-label="Reply"
        >
            <svg class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-width="2" d="M21 15a4 4 0 0 1-4 4H7l-4 4V7a4 4 0 0 1 4-4h10a4 4 0 0 1 4 4z" />
            </svg>
            <span>{replies}</span>
        </button>

        <button
                class="flex items-center gap-2 rounded-xl px-3 py-2 text-slate-600 hover:bg-slate-50"
                aria-label="Repost"
        >
            <svg class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-width="2" d="M4 7h9M13 7l-3-3m3 3l-3 3M20 17h-9m-1 0l3-3m-3 3l3 3" />
            </svg>
            <span>{reposts}</span>
        </button>

        <button
                class="flex items-center gap-2 rounded-xl px-3 py-2 text-slate-600 hover:bg-slate-50"
                aria-label="Like"
        >
            <svg class="h-5 w-5" viewBox="0 0 24 24" fill="currentColor">
                <path
                        d="M12 21s-6.716-3.497-9.193-7.44C.8 10.6 2.137 7 5.5 7c2.02 0 3.29 1.11 3.99 2.21C10.21 8.11 11.48 7 13.5 7c3.36 0 4.7 3.6 2.69 6.56C18.72 17.5 12 21 12 21z"
                />
            </svg>
            <span>{likes}</span>
        </button>

        <button
                class="flex items-center gap-2 rounded-xl px-3 py-2 text-slate-600 hover:bg-slate-50"
                aria-label="Share"
        >
            <svg class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-width="2" d="M4 12v7a1 1 0 0 0 1 1h14M14 9l-3-3-3 3M11 6v12" />
            </svg>
        </button>
    </footer>
</article>
