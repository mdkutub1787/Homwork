import { Component, OnInit } from '@angular/core';
import { UntilDestroy } from '@ngneat/until-destroy';
import { PolicyModel } from '../../model/policy.model';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BillModel } from '../../model/bill.model';
import { ReceiptModel } from '../../model/reciept.model';
import { RecieptService } from '../../service/reciept.service';
import { BillService } from '../../service/bill.service';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';


@UntilDestroy()
@Component({
  selector: 'app-createreciept',
  templateUrl: './createreciept.component.html',
  styleUrls: ['./createreciept.component.css']
})
export class CreaterecieptComponent implements OnInit {

  policies: PolicyModel[] = [];
  billForm!: FormGroup;
  bill: BillModel[] = [];
  reciept: ReceiptModel = new ReceiptModel();
  receiptForm!: FormGroup;



  constructor(
    private recieptService: RecieptService,
    private billService: BillService,
    private policyService: PolicyService,
    private formBuilder: FormBuilder,
    private router: Router
  ) { }

  ngOnInit(): void {
    const currentDate = new Date().toISOString().substring(0, 10); // Format as YYYY-MM-DD
    this.loadPolicies();
    this.loadBills();

    this.receiptForm = this.formBuilder.group({
      id: [''],

      bill: this.formBuilder.group({
        fire: [{ value: '', }],
        rsd: [{ value: '', }],
        netPremium: [{ value: '', }], // Disable to prevent manual editing
        tax:[{ value: '', }],
        grossPremium: [{ value: ''  }], // Disable to prevent manual editing

        policies: this.formBuilder.group({
          id: [undefined],
          billNo: [undefined],
          date: [currentDate],
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
          periodFrom: ['value', Validators.required],
          periodTo: [{ value: '', disabled: true }]
        })
      })
    });

    this.receiptForm.get('periodFrom')?.valueChanges.subscribe(value => {
      if (value) {
        const periodFromDate = new Date(value);
        const periodToDate = new Date(periodFromDate);
        periodToDate.setFullYear(periodFromDate.getFullYear() + 1);
        this.receiptForm.patchValue({
          periodTo: periodToDate.toISOString().substring(0, 10) // Format as YYYY-MM-DD
        }, { emitEvent: false });
      }
    });

    this.receiptForm.get('bill.policies.policyholder')?.valueChanges
    .subscribe(policyholder => {
      const selectedPolicy = this.bill.find(bill => bill.policies.policyholder === policyholder);
      if (selectedPolicy) {
        this.receiptForm.patchValue({
          bill: {
            ...this.receiptForm.get('bill')?.value,
            policies: selectedPolicy.policies
          }
        });
        this.calculatePremiums(); // Recalculate premiums when policyholder changes
      }
    });
  
    // Recalculate premiums when fire, rsd, or tax values change
    this.billForm.get('fire')?.valueChanges.subscribe(() => this.calculatePremiums());
    this.billForm.get('rsd')?.valueChanges.subscribe(() => this.calculatePremiums());
    this.billForm.get('tax')?.valueChanges.subscribe(() => this.calculatePremiums());


  }

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

  calculatePremiums(): void {
    const fire = this.receiptForm.get('bill.fire')?.value || 0;
    const rsd = this.receiptForm.get('bill.rsd')?.value || 0;
    const tax = this.receiptForm.get('bill.tax')?.value || 0;

    const netPremium = fire + rsd;
    const grossPremium = netPremium + tax;

    this.receiptForm.patchValue({
      bill: {
        netPremium: netPremium.toFixed(2),
        grossPremium: grossPremium.toFixed(2)
      }
    });
  }

  createReceipt(): void {
    if (this.receiptForm.valid) {
      const formValues = this.receiptForm.value;
      this.reciept.bill = formValues.bill; // Correct assignment
      this.recieptService.createReciept(this.reciept) // Corrected method name
        .subscribe({
          next: res => {
            this.loadPolicies();
            this.loadBills();
            this.receiptForm.reset();
            this.router.navigate(['viewreceipt']); // Corrected route
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






