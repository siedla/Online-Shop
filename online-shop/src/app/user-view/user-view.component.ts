import { Component, OnInit } from '@angular/core';
import { User } from 'src/model/user';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-user-view',
  templateUrl: './user-view.component.html',
  styleUrls: ['./user-view.component.css']
})
export class UserViewComponent implements OnInit {

  public user: User = {} as any;

  constructor(private userService: UserService) { 
    this.userService.currentUser.subscribe(res => this.user = res)
  }

  ngOnInit(): void {
  }

}
