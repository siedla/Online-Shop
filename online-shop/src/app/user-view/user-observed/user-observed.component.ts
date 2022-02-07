import { Component, Input, OnInit } from '@angular/core';
import { DatabaseService } from 'src/services/database.service';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-user-observed',
  templateUrl: './user-observed.component.html',
  styleUrls: ['./user-observed.component.css']
})
export class UserObservedComponent implements OnInit {

  user: any;
  constructor(private userService: UserService) {
    this.userService.currentUser.subscribe(res => this.user = res);
  }

  async ngOnInit() {
    this.user.observed = (await this.userService.getObserved())[0].getUserObservedProducts;
    this.user.observed.forEach((e: any) => e.id = e.productId)
    // console.log(this.userObserved)
  }

  removeFromUserObserved(id: number) {
    this.user.observed = this.user.observed.filter((ele: any) => ele.id != id);
    this.userService.updateObserved(this.user.observed);
    this.userService.changeUser(this.user);
  }

  clearUserObserved() {
    this.user.observed = [];
    this.userService
    this.userService.updateObserved(this.user.observed);
    this.userService.changeUser(this.user);
  }
}
