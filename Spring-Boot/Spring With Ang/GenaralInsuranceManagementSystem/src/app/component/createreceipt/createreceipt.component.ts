import { Component, OnInit } from '@angular/core';
import { PolicyModel } from '../../model/policy.model';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BillModel } from '../../model/bill.model';
import { BillService } from '../../service/bill.service';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';
import { ReceiptModel } from '../../model/receipt.model';
import { ReceiptService } from '../../service/receipt.service';

@Component({
  selector: 'app-createreceipt',
  templateUrl: './createreceipt.component.html',
  styleUrl: './createreceipt.component.css'
})
export class CreatereceiptComponent implements OnInit{

  policies: PolicyModel[] = [];
  billForm!: FormGroup;
  bill: BillModel[] = [];
  reciept: ReceiptModel = new ReceiptModel();
  receiptForm!: FormGroup;
  selectedBill?: BillModel;



  constructor(
    private receiptService: ReceiptService,
    private billService: BillService,
    private policyService: PolicyService,
    private formBuilder: FormBuilder,
    private router: Router
  ) { }

  ngOnInit(): void {
   
    this.loadPolicies();
    this.loadBills();

    this.receiptForm = this.formBuilder.group({
      id: [''],
      bill: this.formBuilder.group({
        fire: [undefined],
        rsd: [undefined],
        netPremium: [undefined],
        tax: [undefined],
        grossPremium: [undefined],

        policies: this.formBuilder.group({
          id: [undefined],
          billNo: [undefined],
          date: [undefined],
          bankName: [undefined],
          policyholder: [undefined],
          address: [undefined],
          sumInsured: [undefined],
          stockInsured: [undefined],
          interestInsured: [undefined],
          coverage: [undefined],
          location: [undefined],
          construction: [undefined],
          owner: [undefined],
          usedAs: [undefined],
          periodFrom: [undefined],
          periodTo: [undefined],
        })
      })
    });


    this.receiptForm.get('bill.policies.policyholder')?.valueChanges
      .subscribe(policyholder => {
        this.selectedBill = this.bill.find(bill => bill.firePolicy.policyholder === policyholder);
        console.log(this.selectedBill);
        if (this.selectedBill) {
          this.receiptForm.patchValue({
            bill: {
              ...this.receiptForm.get('bill')?.value,
              fire: this.selectedBill.fire,
              rsd: this.selectedBill.rsd,
              netPremium: this.selectedBill.netPremium,
              tax: this.selectedBill.tax,
              grossPremium: this.selectedBill.grossPremium,
              policies: this.selectedBill.firePolicy
            }
          }, { emitEvent: false });
        
        }
      });




  }

  loadPolicies(): void {
    this.policyService.viewAllPolicyForBill()
      .subscribe({
        next: res => {
          this.policies = res;
          console.log(this.policies)
        },
        error: error => {
          console.error('Error loading policies:', error);
        }
      });
  }

  loadBills(): void {
    this.billService.getAllBillForReciept()
      .subscribe({
        next: res => {
          this.bill = res;
        },
        error: error => {
          console.error('Error loading bills:', error);
        }
      });
  }



  createReceipt(): void {
    if (this.receiptForm.valid) {
      const formValues = this.receiptForm.value;
      this.reciept.fireBill = formValues.bill;
      this.receiptService.createReciept(this.reciept)
        .subscribe({
          next: res => {
            this.loadPolicies();
            this.loadBills();
            this.receiptForm.reset();
            this.router.navigate(['viewreciept']);
          },
          error: error => {
            console.error('Error creating receipt:', error);
          }
        });
    } else {
      console.warn('Form is invalid');
    }
  }

}
