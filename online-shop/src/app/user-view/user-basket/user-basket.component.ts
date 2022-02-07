import { Component, Input, OnInit } from '@angular/core';
import { User } from 'src/model/user';
import { DatabaseService } from 'src/services/database.service';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-user-basket',
  templateUrl: './user-basket.component.html',
  styleUrls: ['./user-basket.component.css'],
})
export class UserBasketComponent implements OnInit {
  user: User = {} as any;
  userBasketLarge: any;

  constructor(private db: DatabaseService, private userService: UserService) {
    this.userService.currentUser.subscribe(res => this.user = res);
  }
  removeFromUserBasket(id: number) {
    console.log(this.user.basket, id);
    for (let i = 0; i < this.user.basket.length; i++) {
      if (this.user.basket[i].id == id) {
        this.user.basket[i].quantity = parseInt(this.user.basket[i].quantity) - 1;
        
        if (parseInt(this.user.basket[i].quantity) <= 0)
          this.user.basket.splice(i, 1);
      }
    }
    
    for (let i = 0; i < this.userBasketLarge.length; i++) {
      if (this.userBasketLarge[i].productId == id) {
        this.userBasketLarge[i].quantity =
          parseInt(this.userBasketLarge[i].quantity) - 1;
        if (parseInt(this.userBasketLarge[i].quantity) <= 0)
          this.userBasketLarge.splice(i, 1);
      }
    }
    
    this.userService.updateBasket(this.user.basket);
    this.userService.changeUser(this.user);
  }

  clearUserBasket() {
    this.user.basket = [];

    this.userBasketLarge = [];
    this.userService.updateBasket(this.user.basket);
    this.userService.changeUser(this.user);
  }

  buyItemsFromBasket() {
    this.user.basket = [];
    this.userBasketLarge = [];
    this.userService.buyBasket();
    this.userService.changeUser(this.user);
  }

  async ngOnInit() {
    const res = await this.userService.getBasket();
    this.userBasketLarge = res[0].getUserBasketProducts;
    console.log(this.userBasketLarge, this.user)
  }
}
