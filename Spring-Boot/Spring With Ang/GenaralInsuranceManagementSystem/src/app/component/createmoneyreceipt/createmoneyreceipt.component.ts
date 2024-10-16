import { Component, OnInit } from '@angular/core';
import { PolicyModel } from '../../model/policy.model';
import { BillModel } from '../../model/bill.model';
import { MoneyReceiptModel } from '../../model/moneyreceipt.model';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MoneyreceiptService } from '../../service/moneyreceipt.service';
import { BillService } from '../../service/bill.service';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-createmoneyreceipt',
  templateUrl: './createmoneyreceipt.component.html',
  styleUrl: './createmoneyreceipt.component.css'
})
export class CreatemoneyreceiptComponent implements OnInit {


  policies: PolicyModel[] = [];
  bill: BillModel[] = [];
  moneyreceipt: MoneyReceiptModel = new MoneyReceiptModel();
  moneyreceiptForm!: FormGroup;
  selectedBill?: BillModel;

  constructor(
    private moneyreceiptService: MoneyreceiptService,
    private billService: BillService,
    private policyService: PolicyService,
    private formBuilder: FormBuilder,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.loadPolicies();
    this.loadBills();

    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0];

  
    this.moneyreceiptForm = this.formBuilder.group({
      id: [null],
      issuingOffice: [null],
      classOfInsurance: [null],
      date: [formattedDate],
      modeOfPayment: [null],
      issuedAgainst: [null],
      bill: this.formBuilder.group({
        id: [null],
        fire: [null],
        rsd: [null],
        netPremium: [null],
        tax: [null],
        grossPremium: [null],
        policies: this.formBuilder.group({
          id: [null],
          date: [null],
          bankName: [null],
          policyholder: [null],
          address: [null],
          sumInsured: [null],
          stockInsured: [null],
          interestInsured: [null],
          coverage: [null],
          location: [null],
          construction: [null],
          owner: [null],
          usedAs: [null],
          periodFrom: [null],
          periodTo: [null],
        })
      })
    });

    // Subscribe to policyholder field change
    this.moneyreceiptForm.get('bill.policies.policyholder')?.valueChanges
      .subscribe(policyholder => {
        this.selectedBill = this.bill.find(bill => bill.policy.policyholder === policyholder);
        if (this.selectedBill) {
          this.moneyreceiptForm.patchValue({
            bill: {
              ...this.moneyreceiptForm.get('bill')?.value,
              id: this.selectedBill.id,
              fire: this.selectedBill.fire,
              rsd: this.selectedBill.rsd,
              netPremium: this.selectedBill.netPremium,
              tax: this.selectedBill.tax,
              grossPremium: this.selectedBill.grossPremium,
              policies: this.selectedBill.policy
            }
          }, { emitEvent: false });
        }
      });
  }

  // Load all policies for bills
  loadPolicies(): void {
    this.policyService.viewAllPolicyForBill()
      .subscribe({
        next: res => {
          this.policies = res;
        },
        error: error => {
          console.error('Error loading policies:', error);
        }
      });
  }

  // Load all bills for receipt
  loadBills(): void {
    this.billService.getAllBillForReceipt()
      .subscribe({
        next: res => {
          this.bill = res;
        },
        error: error => {
          console.error('Error loading bills:', error);
        }
      });
  }

  // Create receipt
  createMoneyReceipt(): void {
    if (this.moneyreceiptForm.valid) {
      const formValues = this.moneyreceiptForm.value;
  
      
      this.moneyreceipt.issuingOffice = formValues.issuingOffice;
      this.moneyreceipt.id = formValues.id;
      this.moneyreceipt.classOfInsurance = formValues.classOfInsurance;
      this.moneyreceipt.date = formValues.date;
      this.moneyreceipt.modeOfPayment = formValues.modeOfPayment;
      this.moneyreceipt.issuedAgainst = formValues.issuedAgainst;
      this.moneyreceipt.bill = formValues.bill;
  
      this.moneyreceiptService.createMoneyReceipt(this.moneyreceipt)
        .subscribe({
          next: res => {
            this.moneyreceipt = res;
            this.loadPolicies();
            this.loadBills();
            this.moneyreceiptForm.reset(); 
            this.router.navigate(['viewmoneyreciept']); 
          },
          error: error => {
            console.error('Error creating money receipt:', error);
          }
        });
    } else {
      console.warn('Form is invalid');
    }
  }
  
}
