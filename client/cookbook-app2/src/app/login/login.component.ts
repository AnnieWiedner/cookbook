import { Component } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';

// class User {
//   id: number;
//   email: string;
//   password: string;
// }

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  user = {};
  errorMessage = "";

  constructor(private http: Http, private router: Router){}



  loginUser() {
    this.http.post('http://localhost:9393/users/login', this.user).subscribe(response => {
      window.localStorage.setItem("token", response.json().token)
      response.json().email ? this.router.navigate(['/list']) : this.errorMessage = response.json().error
    })
  }

  registerUser() {
    this.router.navigate(['/register']);
  }

}
