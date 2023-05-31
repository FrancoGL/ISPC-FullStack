import { Component, Input, OnInit } from '@angular/core';
import { PackageCard } from 'src/app/models/package-card';
import { DestinationsService } from 'src/app/services/destinations.service';
import { PackagesService } from 'src/app/services/packages.service';

@Component({
  selector: 'app-package-card',
  templateUrl: './package-card.component.html',
  styleUrls: ['./package-card.component.css']
})
export class PackageCardComponent implements OnInit{
  constructor(private destinationService: DestinationsService) {
    
  }
  @Input() path: string = '#';
  @Input() package!: any;
  stars!: number[];
  duration:any = {
    days: 0,
    nights: 0
  }
  
  ngOnInit(): void {
    this.package.rate = Math.ceil(Math.random() * 5);
    this.stars = Array(Math.ceil(this.package.rate)).fill(0);
    this.duration.days = Number(this.package.end_date.split('-')[2]) - Number(this.package.start_date.split('-')[2]);
    this.duration.nights = this.duration.days - 1;
  }
}
