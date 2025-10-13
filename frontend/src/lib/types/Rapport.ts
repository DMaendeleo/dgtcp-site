// src/lib/types/rapports.ts
export interface Rapport {
    id: number
    title: string
    description: string
    year: number
    dateUploaded: string
    filename: string
    mimeType: string
    filesize: number
    url: string
    createdAt: string
    updatedAt: string
}

export interface Rapports {
   Rapports: {
       docs: Rapport[]
       page: number
       totalPages: number
       hasNextPage: boolean
       hasPrevPage: boolean
   }
}
