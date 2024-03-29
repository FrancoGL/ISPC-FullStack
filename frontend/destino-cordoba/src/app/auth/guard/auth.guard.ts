import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot,Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard {
  constructor(private route: Router,private cookie:CookieService){}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      if(!this.cookie.get('token')){
        this.route.navigate(['/login']);
      }
    return true;
  }
  
}
