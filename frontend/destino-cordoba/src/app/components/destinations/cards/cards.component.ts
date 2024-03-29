import { Component, Input } from '@angular/core';
import { Destination } from 'src/app/services/destinations.service';

@Component({
  selector: 'app-cards',
  templateUrl: './cards.component.html',
  styleUrls: ['./cards.component.css'],
})
export class CardsComponent {
  @Input() path: string = '';
  @Input() destination!: Destination;
}
