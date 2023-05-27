import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  private userUrl: string = 'http://localhost:3000/user';

  getAll(): Observable<User[]> {
    return this.http.get<User[]>(this.userUrl);
  }

  getBy(id: number): Observable<User> {
    return this.http.get<User>(`${this.userUrl}/${id}`)
  }

  deleteBy(id: number) {
    return this.http.delete<User>(`${this.userUrl}/${id}`)
  }
}
