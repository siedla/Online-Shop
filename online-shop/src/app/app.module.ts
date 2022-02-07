import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DataAddingFormComponent } from './employee-view/data-adding-form/data-adding-form.component';
import { DisplayProductsComponent } from './display-products/display-products.component';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SignUpComponent } from './sign-up/sign-up.component';
import { SignInComponent } from './sign-in/sign-in.component';

import { HttpClientModule } from '@angular/common/http';
import { UserViewComponent } from './user-view/user-view.component';
import { UserBasketComponent } from './user-view/user-basket/user-basket.component';
import { UserObservedComponent } from './user-view/user-observed/user-observed.component';
import { UserProfileComponent } from './user-view/user-profile/user-profile.component';
import { UserHistoryComponent } from './user-view/user-history/user-history.component';
import { EmployeeViewComponent } from './employee-view/employee-view.component';
import { EditProductComponent } from './employee-view/edit-product/edit-product.component';
import { NgSelectModule } from '@ng-select/ng-select'; 

@NgModule({
  declarations: [
    AppComponent,
    DataAddingFormComponent,
    DisplayProductsComponent,
    SignUpComponent,
    SignInComponent,
    UserViewComponent,
    UserBasketComponent,
    UserObservedComponent,
    UserProfileComponent,
    UserHistoryComponent,
    EmployeeViewComponent,
    EditProductComponent
  ],
  imports: [

    FormsModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    NgSelectModule

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
