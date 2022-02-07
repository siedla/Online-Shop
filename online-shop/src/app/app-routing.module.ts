import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DataAddingFormComponent } from './employee-view/data-adding-form/data-adding-form.component';
import { DisplayProductsComponent } from './display-products/display-products.component';
import { UserViewComponent } from './user-view/user-view.component';
import { EditProductComponent } from './employee-view/edit-product/edit-product.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { AuthGuard } from './guards/auth.guard';
import { SignInComponent } from './sign-in/sign-in.component';

const routes: Routes = [
  { path: 'product', component: DisplayProductsComponent },
  { path: 'add-data', component: DataAddingFormComponent },
  { path: 'user-view', component: UserViewComponent, canActivate: [AuthGuard] },
  { path: 'edit-data', component: EditProductComponent },
  { path: 'register', component: SignUpComponent },
  { path: 'login', component: SignInComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
