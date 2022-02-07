import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { User } from '../model/user';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private token: string | null;
  private headers: HttpHeaders;
  public loggedIn = new BehaviorSubject<boolean>(false);

  private userSource = new BehaviorSubject<User>({} as User);
  currentUser = this.userSource.asObservable();

  constructor(private http: HttpClient) {
    this.token = null;
    this.headers = new HttpHeaders();
  }

  changeUser(user: any) {
    this.userSource.next(user as User);
  }

  isLoggedIn() {
    return this.loggedIn.asObservable();
  }

  async login(email: string, password: string) {
    const authorize = await this.http
      .post<any>(
        '/api/authorize',
        { email, password },
        { responseType: 'json' }
      )
      .toPromise();

    this.token = authorize.token;
    this.headers = this.headers.append('Authorization', `Bearer ${authorize.token}`);
    this.userSource.next(authorize.user);
    this.loggedIn.next(true);
  }

  async register(user: User) {
    if (this.token === null) {
      const authorize = await this.http
        .post<any>('/api/register', { ...user }, { responseType: 'json' })
        .toPromise();

      this.token = authorize.token;
      this.headers = this.headers.append('Authorization', `Bearer ${authorize.token}`);
      this.loggedIn.next(true);
    }
  }

  async logout() {
    this.headers = this.headers.delete('Authorization');
    this.token = null;
    this.loggedIn.next(false);
  }

  async buyBasket() {
    return this.http
      .put<any>(
        '/api/user/buy/basket',
        {},
        {
          headers: this.headers,
          withCredentials: true,
        }
      )
      .toPromise();
  }

  async updateObserved(observed: any) {
    return this.http
      .put<any>(
        '/api/user/observed',
        { observed: JSON.stringify(observed.map((e: any ) => e = {id: e.productId || e.id})) },
        {
          headers: this.headers,
          withCredentials: true,
          // @ts-ignore
          responseType: 'text' as const
        }
      )
      .toPromise();
  }

  async updateBasket(basket: any) {
    return this.http
      .put<string>(
        '/api/user/basket',
        {
          basket: JSON.stringify(basket.map((e: any ) => e = {id: e.productId || e.id, quantity: e.quantity})),
        },
        { headers: this.headers, withCredentials: true, 
          //@ts-ignore
          responseType: 'text' as const }
      )
      .toPromise();
  }

  async getObserved() {
    return this.http
      .get<any>('/api/user/observed', {
        headers: this.headers,
        withCredentials: true,
      })
      .toPromise<any>();
  }

  async getHistory() {
    return this.http
      .get<any[]>('/api/user/history', {
        headers: this.headers,
        withCredentials: true
      })
      .toPromise<any[]>();
  }

  async getBasket() {
    return this.http
      .get<any>('/api/user/basket', {
        headers: this.headers,
        withCredentials: true,
      })
      .toPromise<any>();
  }

  async deleteProduct(productId: any) {
    return this.http.delete<any>(`/api/product/${productId}`, {
      headers: this.headers,
      withCredentials: true,
      // @ts-ignore
      responseType: 'text'
    }).toPromise();
  }
}
