import { Component, OnInit } from '@angular/core';

import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Category } from 'src/model/cateogry';
import { Product } from 'src/model/product';
import { DatabaseService } from 'src/services/database.service';
import { ProductService } from 'src/services/product.service';

@Component({
  selector: 'app-edit-product',
  templateUrl: './edit-product.component.html',
  styleUrls: ['./edit-product.component.css']
})
export class EditProductComponent implements OnInit {

  public category!: String;
  updateProduct: Product = {} as Product;
  public categoryList: Promise<Category[]>;
  constructor(private db: DatabaseService, private productService: ProductService) {
    this.productService.currentProduct.subscribe(res => this.updateProduct = res);
    this.db.getCategoryNameById(this.updateProduct.categoryID).then(res => this.category= res[0].name);
    this.categoryList = this.db.getCategories();
 }


  ngOnInit(): void {
   
  }

  onSubmit()  {
    console.log(this.updateProduct)
    this.db.getCategoryNameById(this.updateProduct.categoryID).then(res => this.category=res);
    this.db.updateProduct(this.updateProduct, this.category);
    console.log(this.updateProduct);
  };
}
