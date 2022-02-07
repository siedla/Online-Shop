import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Product } from 'src/model/product';
import { DatabaseService } from './database.service';


@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private productSource = new BehaviorSubject<Product>({} as any)
  currentProduct = this.productSource.asObservable();

  constructor(private db: DatabaseService) { }

  changeProduct(product: Product) {
    this.productSource.next(product);
  }

}