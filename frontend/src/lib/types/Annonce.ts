// src/lib/types/rapports.ts
export interface Annonce {
    id: number
    headline: string
    subheadline: string
    description: string
    slug: string
    localisation: string
    year: number
    image: {
        id: number
        filename: string
        mimeType: string
        filesize: string
        url : string
    }
    createdAt: string
    updatedAt: string
}

export interface Annonces {
    Annonces: {
        docs: Annonce[]
        page: number
        totalPages: number
        hasNextPage: boolean
        hasPrevPage: boolean
    }
}
