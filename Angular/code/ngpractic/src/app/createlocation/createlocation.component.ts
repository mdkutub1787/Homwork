import { Component, OnInit } from '@angular/core';
import { LocationService } from '../location/location.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Location } from '../location/location.model';

@Component({
  selector: 'app-createlocation',
  templateUrl: './createlocation.component.html',
  styleUrl: './createlocation.component.css'
})
export class CreatelocationComponent implements OnInit {
  location: Location = new Location();
  formVlaue !: FormGroup;
  locationData: any;

  constructor(
    private locationservice: LocationService,
    private router: Router,
    private httpClient: HttpClient,
    private formBuilder: FormBuilder
  ) { }
  ngOnInit(): void {
    this.formVlaue = this.formBuilder.group({
      name: [''],
      city: [''],
      state: [''],
      photo: [''],
      availableUnits: [''],
      wifi: [''],
      laundry: [''],


    });
  }

  createLocation() {
    this.location.name = this.formVlaue.value.name;
    this.location.city = this.formVlaue.value.city;
    this.location.state = this.formVlaue.value.state;
    this.location.photo = this.formVlaue.value.photo;
    this.location.availableUnits = this.formVlaue.value.availableUnits;
    this.location.wifi = this.formVlaue.value.wifi;
    this.location.laundry = this.formVlaue.value.laundry;


    this.locationservice.creteLocation(this.location)
      .subscribe({
        next: res => {
          console.log(res);
          this.formVlaue.reset;
          this.router.navigate(['/location'])
        },
        error: error => {
          console.log(error);

        }

      })

  }

}
