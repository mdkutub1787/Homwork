import { Component, OnInit } from '@angular/core';
import { BillService } from '../../service/bill.service';
import { BillModel } from '../../model/bill.model';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-bill',
  templateUrl: './bill.component.html',
  styleUrls: ['./bill.component.css']
})
export class BillComponent implements OnInit {

  bills: BillModel[] = [];

  policyes: any;



  constructor(
    private policiesService: PolicyService,
    private billService: BillService,
    private router: Router

  ) { }

  ngOnInit(): void {
    this.loadBills();
  }

  loadBills() {
    this.billService.viewAllBill().subscribe({
      next: (res: BillModel[]) => {
        this.bills = res;
      },
      error: err => {
        console.error('Error loading bills:', err);
        alert('Failed to load bills');
      }
    });
  }

  editBill(bill: BillModel): void {
    this.router.navigate(['/updatebill', bill.id]);
  }

  deleteBill(id: number): void { 
    this.billService.deleteBill(id)
      .subscribe({
        next: () => {
          this.router.navigate(['viewbill']);
        },
        error: (error) => {
          console.log('Error deleting bill:', error);
        }
      });
  }
  

  navigateToAddBill() {
    this.router.navigateByUrl('/createbill');
  }

  navigateToAddReciept() {
    this.router.navigateByUrl('/createreciept');
  }

  getFireAmount(bill: BillModel): number {
    const sumInsured = bill.firePolicy?.sumInsured || 0;
    const fireRate = bill.fire || 0;
    return sumInsured * fireRate;
  }

  getRsdAmount(bill: BillModel): number {
    const sumInsured = bill.firePolicy?.sumInsured || 0;
    const rsdRate = bill.rsd || 0;
    return sumInsured * rsdRate;
  }

  getNetPremium(bill: BillModel): number {
    const sumInsured = bill.firePolicy.sumInsured || 0;
    const fireRate = bill.fire || 0;
    const rsdRate = bill.rsd || 0;

    return sumInsured * (fireRate + rsdRate);
  }

  getTaxAmount(bill: BillModel): number {
    const netPremium = this.getNetPremium(bill);
    const taxRate = 0.15; // 15% fixed tax rate

    return netPremium * taxRate;
  }

  getGrossPremium(bill: BillModel): number {
    const netPremium = this.getNetPremium(bill);
    const taxAmount = this.getTaxAmount(bill);

    return netPremium + taxAmount;
  }


}
