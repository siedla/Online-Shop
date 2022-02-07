import { Component, OnInit } from '@angular/core';
import { Product } from 'src/model/product';
import { User } from 'src/model/user';
import { ProductService } from 'src/services/product.service';
import { UserService } from 'src/services/user.service';
import { DatabaseService } from '../../services/database.service';
import { Category } from 'src/model/cateogry';

@Component({
  selector: 'app-display-products',
  templateUrl: './display-products.component.html',
  styleUrls: ['./display-products.component.css'],
})
export class DisplayProductsComponent implements OnInit {
  public productList: Product[] = [];
  user: User = {} as User;
  categories: Category[] = [];
  selectedItems = [];
  dropdownSettings = {};

  constructor(
    private db: DatabaseService,
    public userService: UserService,
    private productService: ProductService
  ) {
    this.userService.currentUser.subscribe((res) => (this.user = res));
  }

  addToUserBasket(id: number) {

    console.log(id)
    let flag: boolean = true;

    if (this.user === null)
      return;

    for (let i = 0; i < this.user.basket.length; i++) {
      if (this.user.basket[i].id == id) {
        console.log("id", id, this.user.basket[i].id);
        this.user.basket[i].quantity =
          parseInt(this.user.basket[i].quantity) + 1;
        flag = false;
      }
    }

    if (flag) {
      this.user.basket.push({ id: id, quantity: 1 });
    }
    console.log(this.user.basket)
    this.userService.updateBasket(this.user.basket);
  }

  async deleteProduct(id: number) {
    await this.userService.deleteProduct(id);
    this.productList = await this.db.getProducts();
  }

  addToUserObserved(id: number) {
    if (this.user === null)
      return;

    if (this.user.observed.some((ele: any) => ele.id == id)) return;

    this.user.observed.push({ id: id });
    console.log(this.user.observed);
    this.userService.updateObserved(this.user.observed);
  }

  modifyProduct(prod: Product) {
    this.productService.changeProduct(prod);
  }

  async ngOnInit() {
    this.productList = await this.db.getProducts();
    this.categories = await this.db.getCategories();
    console.log(this.productList);
  }

  async getFiltredProducts() {
    console.log(this.selectedItems);
    this.productList = await this.db.getFiltredProducts(this.selectedItems);
  }
}
