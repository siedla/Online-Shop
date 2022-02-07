import { Component, OnInit } from '@angular/core';

import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Category } from 'src/model/cateogry';
import { Product } from 'src/model/product';
import { DatabaseService } from 'src/services/database.service';
import { ProductService } from 'src/services/product.service';

@Component({
  selector: 'app-data-adding-form',
  templateUrl: './data-adding-form.component.html',
  styleUrls: ['./data-adding-form.component.css']
})
export class DataAddingFormComponent implements OnInit {

  newProduct: Product={} as Product;
  category!: String;
  newCategory!: String;
  public categoryList: Promise<Category[]>;
  constructor(private db: DatabaseService) {
    this.categoryList = this.db.getCategories();
 }


  ngOnInit(): void {
  }

  onSubmit()  {
    this.db.addProduct(this.newProduct, this.category);
    this.newProduct.description="";
    this.newProduct.name="";
    this.newProduct.photos="";
    this.newProduct.price=0;
    this.newProduct.quantity=0;
    this.newProduct.thumbnails="";
    //dodawanie do bazy danych ...
  };
  async onSubmitCategory(){
    await this.db.addCategory(this.newCategory);
    await this.db.getCategories();
    this.categoryList = this.db.getCategories();
  }
}
