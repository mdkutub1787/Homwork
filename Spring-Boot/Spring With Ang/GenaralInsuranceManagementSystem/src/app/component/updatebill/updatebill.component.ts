import { Component, OnInit } from '@angular/core';
import { BillModel } from '../../model/bill.model';
import { PolicyModel } from '../../model/policy.model';
import { FormBuilder, FormGroup } from '@angular/forms';
import { PolicyService } from '../../service/policy.service';
import { BillService } from '../../service/bill.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-updatebill',
  templateUrl: './updatebill.component.html',
  styleUrls: ['./updatebill.component.css']
})
export class UpdatebillComponent implements OnInit {

  bill: BillModel = new BillModel();
  policies: PolicyModel[] = [];
  billId: number = 0;
  billForm!: FormGroup;

  constructor(
    private policiesService: PolicyService,
    private billService: BillService,
    private formBuilder: FormBuilder,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.billId = +this.route.snapshot.params['id']; // Ensure id is a number
    console.log(this.billId);
    
    this.billForm = this.formBuilder.group({
      fire: [''],
      rsd: [''],
      netPremium: [{ value: '', disabled: true }],
      tax: [''],
      grossPremium: [{ value: '', disabled: true }],
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
        periodTo: [undefined]
      })
    });

    this.loadPolicies();
    this.loadBillDetails();

    // Recalculate premiums when fire, rsd, or tax values change
    this.billForm.get('fire')?.valueChanges.subscribe(() => this.calculatePremiums());
    this.billForm.get('rsd')?.valueChanges.subscribe(() => this.calculatePremiums());
    this.billForm.get('tax')?.valueChanges.subscribe(() => this.calculatePremiums());
  }

  loadPolicies(): void {
    this.policiesService.viewAllPolicyForBill()
      .subscribe({
        next: (res: PolicyModel[]) => {
          this.policies = res;
        },
        error: err => {
          console.error('Error loading policies:', err);
        }
      });
  }

  loadBillDetails(): void {
    this.billService.getByBillId(this.billId)
      .subscribe({
        next: (bill: BillModel) => {
          this.bill = bill;
          this.billForm.patchValue({
            fire: bill.fire,
            rsd: bill.rsd,
            netPremium: bill.netPremium,
            tax: bill.tax,
            grossPremium: bill.grossPremium,
            policies: bill.firePolicy
          });
        },
        error: error => {
          console.error('Error loading bill details:', error);
        }
      });
  }
  
  

  calculatePremiums(): void {
    const formValues = this.billForm.value;
    const sumInsured = formValues.policies.sumInsured || 0;
    const fireRate = formValues.fire || 0;
    const rsdRate = formValues.rsd || 0;
    const taxRate = formValues.tax || 0;

    const netPremium = (sumInsured * fireRate) + (sumInsured * rsdRate);
    const grossPremium = netPremium + (netPremium * taxRate);

    this.billForm.patchValue({
      netPremium: netPremium,
      grossPremium: grossPremium
    }, { emitEvent: false });
  }

  updateBill(): void {
    const updatedBill: BillModel = {
      ...this.bill,
      ...this.billForm.getRawValue()
    };
  
    this.billService.updateBill(this.billId, updatedBill)
      .subscribe({
        next: (res: BillModel) => {
          console.log('Bill updated successfully:', res);
          this.billForm.reset();
          this.router.navigate(['/viewbill']);
        },
        error: (error) => {
          console.error('Error updating bill:', error);
        }
      });
  }
  
  }
  
