import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from 'src/app/models/user';
@Injectable({
  providedIn: 'root',
})
export class RegisterService {
  constructor(private http: HttpClient) {}
  url: string = 'http://localhost:3000';

  registerUser(user: User) {
    return this.http.post(this.url + '/users', user);
  }
}
