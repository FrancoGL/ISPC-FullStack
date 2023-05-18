import { Component, OnDestroy, OnInit } from '@angular/core';
import { Observable, Subscription } from 'rxjs';
import { PackageCard } from 'src/app/models/package-card';
import { Destination, DestinationsService } from 'src/app/services/destinations.service';
import { PackagesService } from 'src/app/services/packages.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {
  subscription : Subscription | undefined;
  packages! : PackageCard[];
  packageUrl = 'travel/';
  destinations$: Observable<Destination[]>;

  constructor(private packageService : PackagesService,private destinationsService: DestinationsService) {
    this.destinations$ = this.destinationsService.getDestinations();
  }

  ngOnInit(): void {
    this.subscription = this.packageService.getPackages().subscribe((data : PackageCard[]) => {
      this.packages = data ;
      console.log(data)
    });
    
  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
  }

}

