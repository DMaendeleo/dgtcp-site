import type {CollectionConfig} from 'payload'
import {TextareaHTMLAttributes} from "react";
import {Field} from "payload";

export const PDFReports: CollectionConfig = {
    slug: 'rapports',
    labels: {
        singular: 'Rapport en PDF',
        plural: 'Rapports PDF',
    },
    access: {
        read: () => true, // Publicly readable
    },
    upload: {
        staticDir: './uploads/rapports', // where files will be stored
        mimeTypes: ['application/pdf'], // restrict to PDF
    },
    fields: [
        {
            name: 'title',
            type: 'textarea',
            required: true,
            admin: {
                rows: 2, // just the visible height in the admin UI
                placeholder: "Ecrivez le titre du rapport... "
            } as TextareaHTMLAttributes<any>
        },
        {
            name: 'description',
            type: 'textarea',
            required: true,
            admin: {
                rows: 7, // just the visible height in the admin UI
                placeholder: 'Ecrivez la description du rapport...'
            }
        },
        {
            name: 'year',
            type: 'number',
            label: 'Year',
            required: true,
            index: true,                      // speeds up filtering by year
            admin: {
                position: 'sidebar',
                description: 'Year the report was produced',
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
        },
        {
            name: 'dateUploaded',
            type: 'date',
            label: 'Date Uploaded',
            admin: {
                readOnly: true,
            },
            hooks: {
                beforeChange: [
                    ({ siblingData, operation }) => {
                        if (operation === 'create') {
                            siblingData.dateUploaded = new Date().toISOString();
                        }
                        return siblingData.dateUploaded;
                    },
                ],
            },
        }
    ]  as Field[],
};
