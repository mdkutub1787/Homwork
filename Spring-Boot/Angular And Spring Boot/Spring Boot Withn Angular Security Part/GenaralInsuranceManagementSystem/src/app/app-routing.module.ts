import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PolicyComponent } from './component/policy/policy.component';
import { RegistrationComponent } from './registration/registration.component';
import { LoginComponent } from './login/login.component';
import { UserprofileComponent } from './userprofile/userprofile.component';
import { LogoutComponent } from './logout/logout.component';
import { CreatepolicyComponent } from './component/createpolicy/createpolicy.component';
import { UpdatepolicyComponent } from './component/updatepolicy/updatepolicy.component';
import { BillComponent } from './component/bill/bill.component';
import { CreatebillComponent } from './component/createbill/createbill.component';
import { UpdatebillComponent } from './component/updatebill/updatebill.component';
import { PolicydetailsComponent } from './component/policydetails/policydetails.component';
import { MoneyreceiptComponent } from './component/moneyreceipt/moneyreceipt.component';
import { CreatemoneyreceiptComponent } from './component/createmoneyreceipt/createmoneyreceipt.component';
import { PrintmoneyreceiptComponent } from './component/printmoneyreceipt/printmoneyreceipt.component';
import { UpdateMarineBillComponent } from './marinecomponent/update-marine-bill/update-marine-bill.component';
import { PrintMarinemoneyReceiptComponent } from './marinecomponent/print-marinemoney-receipt/print-marinemoney-receipt.component';
import { BillDetailsComponent } from './component/bill-details/bill-details.component';
import { UpdateMarineMoneyReceiptComponent } from './marinecomponent/update-marine-money-receipt/update-marine-money-receipt.component';
import { MarinePolicyComponent } from './marinecomponent/marine-policy/marine-policy.component';
import { MarineBillComponent } from './marinecomponent/marine-bill/marine-bill.component';
import { CreateMarineBillComponent } from './marinecomponent/create-marine-bill/create-marine-bill.component';
import { MarinePolicyDetailsComponent } from './marinecomponent/marine-policy-details/marine-policy-details.component';
import { MarineBillDetailsComponent } from './marinecomponent/marine-bill-details/marine-bill-details.component';
import { MarineMaoneyReceiptComponent } from './marinecomponent/marine-maoney-receipt/marine-maoney-receipt.component';
import { CreateMarineMaoneyReceiptComponent } from './marinecomponent/create-marine-maoney-receipt/create-marine-maoney-receipt.component';
import { CreateMarinePolicyComponent } from './marinecomponent/create-marine-policy/create-marine-policy.component';


const routes: Routes = [
  {path: '',pathMatch: 'full',redirectTo: '/home'},
  {path: 'home',component: HomeComponent},
  { path: "viewpolicy", component: PolicyComponent },
  { path: "createpolicy", component: CreatepolicyComponent },
  { path: "updatepolicy/:id", component: UpdatepolicyComponent },
  { path: "details/:id", component: PolicydetailsComponent },
  { path: "viewbill", component: BillComponent },
  { path: "billdetails/:id", component: BillDetailsComponent },
  { path: "createbill", component: CreatebillComponent },
  { path: "updatebill/:id", component: UpdatebillComponent},
  { path: "viewmoneyreciept", component: MoneyreceiptComponent},
  { path: "createmoneyreciept", component: CreatemoneyreceiptComponent},
  { path: "printmoneyreciept/:id", component: PrintmoneyreceiptComponent},
  { path: "viewmarinelist", component: MarinePolicyComponent},
  { path: "marinedetails/:id", component: MarinePolicyDetailsComponent },
  { path: 'createmarinelist', component: CreateMarinePolicyComponent },
  { path: 'updatemarinelist/:id', component: CreateMarinePolicyComponent },
  { path: "viewmarinebill", component: MarineBillComponent},
  { path: 'createmarinebill', component: CreateMarineBillComponent },
  { path: 'updatemarinebill/:id', component: UpdateMarineBillComponent },
  { path: "marinebilldetails/:id", component: MarineBillDetailsComponent },
  { path: "viewmarinemoneyreceipt", component: MarineMaoneyReceiptComponent },
  { path: "updatemarinemoneyreceipt/:id", component: UpdateMarineMoneyReceiptComponent },
  { path: "createmarinemoneyreceipt", component: CreateMarineMaoneyReceiptComponent },
  { path: "printmarinemoney/:id", component: PrintMarinemoneyReceiptComponent },
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