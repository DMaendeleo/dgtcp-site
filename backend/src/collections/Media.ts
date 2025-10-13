import type { CollectionConfig } from 'payload'

export const Media: CollectionConfig = {
  slug: 'media',
  access: {
    read: () => true,
  },
  fields: [
    {
      name: 'nom',
      type: 'text',
      required: true,
    },
  ],
  upload: {
    staticDir: './uploads/media', // where files will be stored
    mimeTypes: [
      'image/jpeg',
      'image/jpg',
      'image/png',
      'image/webp',
      'image/gif',
      'image/avif',
    ], // restrict to images
  },
}
