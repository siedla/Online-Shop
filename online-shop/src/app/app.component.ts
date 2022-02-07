import { Component } from '@angular/core';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'online-shop';

  isEmp: boolean = false;

  constructor(public userService: UserService) {
    userService.currentUser.subscribe(res => this.isEmp = res.isEmployee);
  }

  logout() {
    this.userService.logout();
  }

}
