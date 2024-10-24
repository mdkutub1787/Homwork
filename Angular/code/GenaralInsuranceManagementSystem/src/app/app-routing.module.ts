import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PolicyComponent } from './component/policy/policy.component';
import { UpdatepolicyComponent } from './component/updatepolicy/updatepolicy.component';
import { BillComponent } from './component/bill/bill.component';
import { CreatepolicyComponent } from './component/createpolicy/createpolicy.component';
import { CreatebillComponent } from './component/createbill/createbill.component';
import { UpdatebillComponent } from './component/updatebill/updatebill.component';
import { RecieptComponent } from './component/reciept/reciept.component';
import { CreaterecieptComponent } from './component/createreciept/createreciept.component';
import { RegistrationComponent } from './registration/registration.component';
import { LoginComponent } from './login/login.component';
import { UserprofileComponent } from './userprofile/userprofile.component';
import { LogoutComponent } from './logout/logout.component';
import { SearchComponent } from './search/search.component';

const routes: Routes = [
  {path: '',pathMatch: 'full',redirectTo: '/home'},
  {path: 'home',component: HomeComponent},
  { path: "viewpolicy", component: PolicyComponent },
  { path: "createpolicy", component: CreatepolicyComponent },
  { path: "updatepolicy/:id", component: UpdatepolicyComponent },
  { path: "viewbill", component: BillComponent },
  { path: "createbill", component: CreatebillComponent },
  { path: "updatebill/:id", component: UpdatebillComponent},
  { path: "viewreciept", component: RecieptComponent},
  { path: "createreciept", component: CreaterecieptComponent},
  { path: "reg", component: RegistrationComponent},
  { path: "login", component: LoginComponent},
  { path: "logout", component: LogoutComponent},
  { path: "userprofile", component: UserprofileComponent},
  { path: 'search', component: SearchComponent },


  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
