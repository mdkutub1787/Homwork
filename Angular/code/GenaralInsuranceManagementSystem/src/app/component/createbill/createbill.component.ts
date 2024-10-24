import { Component } from '@angular/core';
import { PolicyModel } from '../../model/policy.model';
import { FormBuilder, FormGroup } from '@angular/forms';
import { BillModel } from '../../model/bill.model';
import { BillService } from '../../service/bill.service';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-createbill',
  templateUrl: './createbill.component.html',
  styleUrl: './createbill.component.css'
})
export class CreatebillComponent {
  policies: PolicyModel[] = [];
  billForm!: FormGroup;
  bill: BillModel = new BillModel();

  constructor(
    private billService: BillService,
    private policyService: PolicyService,
    private formBuilder: FormBuilder,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.loadPolicies();

    this.billForm = this.formBuilder.group({
      fire: [''],
      rsd: [''],
      netPremium: [{ value: '', disabled: true }], // Disable to prevent manual editing
      tax: [''],
      grossPremium: [{ value: '', disabled: true }], // Disable to prevent manual editing
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
        usedAs: [undefined],
      })
    });

    this.billForm.get('policies')?.get('policyholder')?.valueChanges
      .subscribe(policyholder => {
        const selectedPolicy = this.policies.find(policy => policy.policyholder === policyholder);
        if (selectedPolicy) {
          this.billForm.get('policies')?.patchValue(selectedPolicy);
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

  calculatePremiums(): void {
    const formValues = this.billForm.value;
    const sumInsured = formValues.policies.sumInsured || 0;
    const fireRate = formValues.fire || 0;
    const rsdRate = formValues.rsd || 0;
    const taxRate = formValues.tax || 0;

    const netPremium = (sumInsured * fireRate + sumInsured * rsdRate);
    const grossPremium = netPremium + (netPremium * taxRate);

    this.billForm.patchValue({
      netPremium: netPremium,
      grossPremium: grossPremium
    }, { emitEvent: false });
  }

  createBill(): void {
    const formValues = this.billForm.value;

    this.bill.fire = formValues.fire;
    this.bill.rsd = formValues.rsd;
    this.bill.netPremium = formValues.netPremium;
    this.bill.tax = formValues.tax;
    this.bill.grossPremium = formValues.grossPremium;
    this.bill.policies = formValues.policies;

    this.billService.createBill(this.bill)
      .subscribe({
        next: res => {
          this.loadPolicies();
          this.billForm.reset();
          this.router.navigate(['viewbill']);
        },
        error: error => {
          console.error('Error creating bill:', error);
        }
      });
  }
}
