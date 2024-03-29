import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { FormGroup } from "@angular/forms";
import { City } from "../models/city";

export interface Destination {
  id: number;
  name: string;
  description: string;
  city: City;
}

@Injectable({
  providedIn: "root",
})
export class DestinationsService {
  constructor(private http: HttpClient) {}

  private destinationUrl: string = "http://localhost:8000/destinations";

  getAll() {
    return this.http.get<any>(this.destinationUrl);
  }

  getBy(id?: number) {
    return this.http.get<any>(`${this.destinationUrl}/${id}`);
  }

  post(destination: object) {
    return this.http.post(this.destinationUrl, destination);
  }

  update(destination: object, id?: number) {
    return this.http.put(`${this.destinationUrl}/${id}`, destination);
  }

  deleteBy(id: number) {
    return this.http.delete(`${this.destinationUrl}/${id}`);
  }

  getDestinations() {
    return this.http.get<any>(this.destinationUrl);
  }
}
