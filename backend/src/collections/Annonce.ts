import {slugify} from "../../utils/Utils";
import {CollectionConfig, Field} from "payload";

export const Annonce: CollectionConfig = {
    slug: 'annonces',
    access: {
        read: () => true, // Publicly readable
    },
    fields: [
        {
            name: 'headline',
            type: 'textarea',
            required: true,
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Ecrivez le grand titre de l'evenement..."
            }
        },
        {
            name: 'subheadline',
            type: 'textarea',
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Ecrivez le sous-titre si disponible... "
            }
        },
        {
            name: 'image',
            type: 'upload',
            relationTo: 'media',
            required: true
        },
        {
            name: 'description',
            type: 'textarea',
            required: true,
            admin: {
                rows: 15, // just the visible height in the admin UI
                placeholder: 'Ecrivez le resumé ou la description entiere du post...',
            }
        },
        {
            name: 'slug',
            type: 'text',
            index: true,
            admin: {
                readOnly: false, position: 'sidebar', description: 'Auto-generated from headline'
            },
            hooks: {
                beforeValidate: [
                    async ({value, siblingData, originalDoc, operation, req}) => {
                        // keep existing slug if user already has one
                        if (value && value.trim()) return slugify(value)

                        // source text to slugify
                        const src =
                            siblingData?.headline ||
                            originalDoc?.headline ||
                            ''

                        let base = slugify(src || '')
                        if (!base) base = 'annonce' // fallback

                        // ensure uniqueness (append -2, -3, ...)
                        let slug = base
                        let i = 2
                        while (true) {
                            const result = await req.payload.find({
                                collection: 'annonces',
                                limit: 1,
                                where: {slug: {equals: slug}},
                            } as any)
                            const hit = result?.docs?.[0]
                            if (!hit || (operation === 'update' && hit.id === originalDoc?.id)) break
                            slug = `${base}-${i++}`
                        }
                        return slug
                    }]
            },
        },
        {
            name: 'localisation',
            type: 'text',
            admin: {
                position: 'sidebar',
                description: 'The place the event happened',
            },
            required: true,
        },
        {
            name: 'year',
            type: 'number',
            label: 'Year',
            required: true,
            index: true,                      // speeds up filtering by year
            admin: {
                position: 'sidebar',
                description: 'Year the event happened',
                step: 1,                        // UI nudges integers in Admin
            },
            defaultValue: () => new Date().getFullYear(),
            validate: (value: any) => {
                if (value === null || value === undefined) return 'Year is required';
                if (!Number.isInteger(value)) return 'Year must be an integer';
                const now = new Date().getFullYear();
                if (value < 1990 || value > now + 1) return `Year must be between 1990 and ${now + 1}`;
                return true;
            },
        }
    ] as Field[],
}


// upload: {
//     staticDir: './annonces', // where files will be stored
//     mimeTypes: [
//         'image/jpeg',
//         'image/jpg',
//         'image/png',
//         'image/webp',
//         'image/gif',
//         'image/avif',
//     ], // restrict to images
// },
