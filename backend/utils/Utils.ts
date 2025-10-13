// utils/slugify.ts
export const slugify = (s: string) =>
    s
        .normalize('NFKD').replace(/[\u0300-\u036f]/g, '') // remove accents
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')                      // non-alnum -> dash
        .replace(/^-+|-+$/g, '')                          // trim dashes
        .slice(0, 60);                                    // keep it short
