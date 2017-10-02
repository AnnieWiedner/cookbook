import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';

class User {
  id: number;
  name: string;
  email: string;
  password: string;
  image_url: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})

export class RegisterComponent implements OnInit {
  newUser: User = new User();
  users: User[] = [];

  constructor(private http: Http, private router: Router){}

  ngOnInit() {
  }

  registerUser() {
    this.http.post('http://localhost:9393/users/register', this.newUser).subscribe(response => {
      this.users = response.json();
      this.router.navigate(['/list']);
    })
  }


}
