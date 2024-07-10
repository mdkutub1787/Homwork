import { HttpClient } from '@angular/common/http';
import { Injectable, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Location } from './location.model';

@Injectable({
  providedIn: 'root'
})
export class LocationService {
  baseUrl: string = "http://localhost:3000/locations";


  constructor(private httpClient: HttpClient) { }


  getAllLocation(): Observable<any> {
    return this.httpClient.get(this.baseUrl);

  }

  creteLocation(location: Location): Observable<any> {
    return this.httpClient.post(this.baseUrl, location);

  }

  deleteLocation(id: string) {

    return this.httpClient.delete(this.baseUrl + "/" + id);

  }
}
