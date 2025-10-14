export function fullDate(iso: string): string {
    const formatted = new Date(iso).toLocaleDateString("fr-FR", {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "2-digit"
    });
    return formatted.charAt(0).toUpperCase() + formatted.slice(1);
}

export function shortDate(iso: string): string {
    return new Date(iso).toLocaleDateString("fr-FR",
        {
            year: "numeric",
            month: "long",
            day: "2-digit"
        });
}

export async function subscribeNewsLetter(email: string) {
    return await fetch('/api/subscribe', {
        method: 'POST',
        headers: {'content-type': 'application/json'},
        body: JSON.stringify({email})
    });
}
