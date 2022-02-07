import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {
  email = new FormControl('test@test.pl');
  password = new FormControl('zaq1@WSX');

  constructor(private user: UserService, private router: Router) { }

  ngOnInit(): void {
  }

  async login() {
    try {
      await this.user.login(this.email.value, this.password.value);
      this.router.navigate(['/user-view']);
    } catch (err) {
      console.log('unsuccessful login');
    }
  }

}
