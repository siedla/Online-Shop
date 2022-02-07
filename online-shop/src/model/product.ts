export interface Product {
    productId: number,
    categoryID: number,
    categoryName?: string,
    name: string,
    price: number,
    quantity: number,
    photos: string,
    thumbnails: string,
    description: string
}
