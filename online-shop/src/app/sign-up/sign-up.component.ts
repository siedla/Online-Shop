import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/model/user';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  email = new FormControl('');
  birthDate = new FormControl('');
  fullName = new FormControl('');
  password = new FormControl('');
  username = new FormControl('');

  constructor(private userService: UserService, private router: Router) { }

  ngOnInit(): void {
  }

  async register() {
    const state = await this.userService.register({
      email: this.email.value,
      customerPassword: this.password.value,
      birthDate: this.birthDate.value,
      fullName: this.fullName.value,
      username: this.username.value,
    } as unknown as User);
    this.router.navigate(['/user-view']);
  }
}
