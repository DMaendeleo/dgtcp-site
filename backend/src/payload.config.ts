// storage-adapter-import-placeholder
import {postgresAdapter} from '@payloadcms/db-postgres'
import {payloadCloudPlugin} from '@payloadcms/payload-cloud'
import {lexicalEditor} from '@payloadcms/richtext-lexical'
import path from 'path'
import {buildConfig} from 'payload'
import {fileURLToPath} from 'url'
import sharp from 'sharp'

import {Users} from './collections/Users'
import {Media} from '@/collections/Media'
import {PDFReports} from "@/collections/Report";
import {Annonce} from "@/collections/Annonce";
import {Partenaire} from "@/collections/Partenaire";
import * as process from "node:process";

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

export default buildConfig({
    admin: {
        user: Users.slug,
        importMap: {
            baseDir: path.resolve(dirname),
        },
    },

    db: postgresAdapter({
        pool: {
            connectionString: process.env.DATABASE_URL
        }
    }),

    editor: lexicalEditor(),
    secret: process.env.PAYLOAD_SECRET || "",


    typescript: {
        outputFile: path.resolve(dirname, 'payload-types.ts'),
    },
    sharp,
    plugins: [
        payloadCloudPlugin(),
        // storage-adapter-placeholder
    ],

    collections:
        [
            Users,
            Media,
            PDFReports,
            Annonce,
            Partenaire
        ],

    globals: [
        {
            slug: 'siteHeader',
            access: {
                read: () => true, // public can fetch header
            },
            fields: [
                {
                    name: 'logo',
                    type: 'upload',
                    relationTo: 'media',
                    required: true,
                },
                {
                    name: 'links',
                    label: 'Navigation',
                    type: 'array',
                    minRows: 1,
                    fields: [
                        {name: 'label', type: 'text', required: true},
                        {name: 'href', type: 'text', required: true},
                        {name: 'external', type: 'checkbox', defaultValue: false},
                        {
                            name: 'children',
                            label: 'Dropdown',
                            type: 'array',
                            fields: [
                                {name: 'label', type: 'text', required: true},
                                {name: 'href', type: 'text', required: true},
                                {name: 'external', type: 'checkbox', defaultValue: false},
                            ],
                        },
                    ],
                },
                {
                    name: 'cta',
                    label: 'CTA Button',
                    type: 'group',
                    fields: [
                        {name: 'label', type: 'text'},
                        {name: 'href', type: 'text'},
                    ],
                },
            ],
        }
    ]
})
