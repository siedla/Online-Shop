import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Product } from 'src/model/product';
import { User } from 'src/model/user';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root',
})
export class DatabaseService {

  private static readonly host: string = 'http://localhost:3000';

  constructor(private http: HttpClient) {}

  async getProducts() {
    return this.http
      .get<any[]>(`/api/product`, { responseType: 'json' })
      .toPromise<any[]>();
  }

  // TODELETE
  async getCustomerById(id: number): Promise <User> {
    return this.http
    .get<User>(`/api/user/${id}`, { responseType: 'json' })
    .toPromise<User>();
  }

  async getFiltredProducts(id: number[]) {
    const params = {
      categories: id.join(',')
    }
    
    return this.http
      .get<any[]>('/api/product', { params: params, responseType: 'json' })
      .toPromise<any[]>();
  }

  async addProduct(newProduct: Product, category: String) {
    this.http
    .post<any>(`${DatabaseService.host}/api/product`, {product: newProduct, category: category}).subscribe({
      next: data => {
          console.log(data.id);
      },
      error: error => {
          console.error('There was an error!', error);
      }
    });
  }

  async deleteProduct(id: number) {
    this.http
    .delete<any>(`${DatabaseService.host}/api/product/${id}`, {}).subscribe({
      next: data => {
          console.log(data.id);
      },
      error: error => {
          console.error('There was an error!', error);
      }
    });
  }

  async updateProduct(updateProduct: Product, category: String) {
    this.http
    .put<any>(`${DatabaseService.host}/api/product/${updateProduct.productId}`, {product: updateProduct, category: category}).subscribe({
      next: data => {
          console.log(data.id);
      },
      error: error => {
          console.error('There was an error!', error);
      }
    });
  }

  async getCategoryNameById(id: number) {
    return this.http
    .get<any>(`${DatabaseService.host}/api/category/${id}`,{})
    .toPromise<any>();
  }


  async getUserHistory(id: number) {
    return this.http
      .get<any[]>(`${DatabaseService.host}/api/user/history/${id}`, { responseType: 'json' })
      .toPromise<any[]>();
  }

  async getLargeObserved(id: number) {
    return this.http
    .get<any[]>(`${DatabaseService.host}/api/observed/large/${id}`,{})
    .toPromise<any[]>();
  }

  async getLargeBasket(id: number) {
    return this.http
    .get<any[]>(`${DatabaseService.host}/api/basket/large/${id}`,{})
    .toPromise<any[]>();  
  }

  async getCategories(): Promise<any[]> {
    return this.http
      .get<any[]>(`${DatabaseService.host}/api/category`, { responseType: 'json' })
      .toPromise<any[]>();
  }

  async addCategory(category: String) {
    this.http
    .post<any>(`http://localhost:3000/api/category`, {category: category}).subscribe({
      next: data => {
          console.log(data.id);
      },
      error: error => {
          console.error('There was an error!', error);
      }
    });
  }

}
