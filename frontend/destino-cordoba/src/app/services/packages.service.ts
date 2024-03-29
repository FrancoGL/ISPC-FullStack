import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PackageCard } from '../models/package-card';
import { Package } from '../models/package';
@Injectable({
  providedIn: 'root'
})
export class PackagesService {

  constructor(private http: HttpClient) { }
  apiURL = 'http://localhost:8000/';


  getPackages() {
    return this.http.get<Package[]>(this.apiURL+'packages');
  }

  getAll() {
    return this.http.get<any>(this.apiURL+'packages')
  }
  getPackageById(id : number) {
    return this.http.get<Package>(this.apiURL+'packages/'+id);
  }

  post(data: object) {
    return this.http.post(this.apiURL+'packages', data)
  }
  setPackages(packageTravel : PackageCard) {
    return this.http.post(this.apiURL+'packages', packageTravel);
  }

  deleteBy(id?: number) {
    return this.http.delete(`${this.apiURL+'packages'}/${id}`)
  }
}
