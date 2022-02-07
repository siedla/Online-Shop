import { Component, Input, OnInit } from '@angular/core';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-user-history',
  templateUrl: './user-history.component.html',
  styleUrls: ['./user-history.component.css']
})
export class UserHistoryComponent implements OnInit {
  userHistory: any[] = [];
  @Input() userId: number = 0;

  constructor(private user: UserService) { }

  async ngOnInit() {
    this.userHistory = await this.user.getHistory();
  }

}
