import type {CollectionConfig} from 'payload'
import { Field } from 'payload'

export const Partenaire: CollectionConfig = {
    slug: 'partenaire',
    access: {
        read: () => true, // Publicly readable
    },
    // upload: {
    //     staticDir: './partenaires', // where files will be stored
    //     mimeTypes: [
    //         'image/jpeg',
    //         'image/jpg',
    //         'image/png',
    //         'image/webp',
    //         'image/gif',
    //         'image/avif',
    //     ], // restrict to images
    // },
    fields: [
        {
            name: 'image',
            label: 'Image ou Logo du partenaire',
            type: 'upload',
            relationTo: 'media',
            required: true,
            filterOptions: {
                mimeType: { in: [
                        'image/jpeg',
                        'image/png',
                        'image/webp',
                        'image/gif',
                        'image/avif'] }
            },
        },
        {
            name: 'sigle',
            type: 'textarea',
            admin: {
                rows: 1, // just the visible height in the admin UI
                placeholder: "Ecrivez le SIGLE du partenaire... "
            }
        },
        {
            name: 'name',
            type: 'textarea',
            required: true,
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Ecrivez le nom du partenaire... "
            }
        },
        {
            name: 'site',
            type: 'textarea',
            required: true,
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Site web du partenaire - https://example.cd "
            }
        },
        {
            name: 'description',
            type: 'textarea',
            required: true,
            admin: {
                rows: 10, // just the visible height in the admin UI
                placeholder: "Ecrivez la description / Resumé du partenaire... "
            }
        },
        {
            name: 'conlusion',
            type: 'textarea',
            required: true,
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Ecrivez une ligne de conlusion ou cloture.. "
            }
        }
    ] as Field[],
};
