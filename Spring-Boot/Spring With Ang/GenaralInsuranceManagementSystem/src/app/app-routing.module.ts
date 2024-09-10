import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PolicyComponent } from './component/policy/policy.component';
import { RegistrationComponent } from './registration/registration.component';
import { LoginComponent } from './login/login.component';
import { UserprofileComponent } from './userprofile/userprofile.component';
import { LogoutComponent } from './logout/logout.component';
import { CreatepolicyComponent } from './component/createpolicy/createpolicy.component';


const routes: Routes = [
  {path: '',pathMatch: 'full',redirectTo: '/home'},
  {path: 'home',component: HomeComponent},
  { path: "viewpolicy", component: PolicyComponent },
  { path: "createpolicy", component: CreatepolicyComponent },
  { path: "reg", component: RegistrationComponent},
  { path: "login", component: LoginComponent},
  { path: "logout", component: LogoutComponent},
  { path: "userprofile", component: UserprofileComponent},


  { path: "**", redirectTo: 'login', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
