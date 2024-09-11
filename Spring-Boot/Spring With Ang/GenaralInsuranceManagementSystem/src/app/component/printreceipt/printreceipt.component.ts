import { Component, OnInit } from '@angular/core';
import { ReceiptModel } from '../../model/receipt.model';
import { ReceiptService } from '../../service/receipt.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-printreceipt',
  templateUrl: './printreceipt.component.html',
  styleUrl: './printreceipt.component.css'
})
export class PrintreceiptComponent implements OnInit{

  receipt?: ReceiptModel;

  constructor(
    private receiptService: ReceiptService,
    private router: Router,
    private route: ActivatedRoute 
  ) { }



  ngOnInit(): void {

    const id = this.route.snapshot.params['id'];
    this.receiptService.getRecieptById(id).subscribe({
      next: response => {
        this.receipt = response;
      },
      error: error => {
        alert(error)
      }
    })

  }

  getFirePremium(receipt: ReceiptModel | undefined): number {
    if (receipt && receipt.fireBill && receipt.fireBill.firePolicy) {
      const sumInsured = receipt.fireBill.firePolicy.sumInsured || 0;
      const fire = receipt.fireBill.fire || 0;
      return (sumInsured * fire) / 100;
    }
    return 0;
  }

  getVAT(receipt: ReceiptModel | undefined): number {
    if (receipt && receipt.fireBill && receipt.fireBill.firePolicy) {
      const sumInsured = receipt.fireBill.firePolicy.sumInsured || 0;
      const fire = receipt.fireBill.fire || 0;
      const tax = receipt.fireBill.tax || 0;
      return (sumInsured * fire / 100) * (tax / 100);
    }
    return 0;
  }

  getGrossPremium(receipt: ReceiptModel | undefined): number {
    if (receipt && receipt.fireBill && receipt.fireBill.firePolicy) {
      const sumInsured = receipt.fireBill.firePolicy.sumInsured || 0;
      const fire = receipt.fireBill.fire || 0;
      const tax = receipt.fireBill.tax || 0;
      const firePremium = sumInsured * fire / 100;
      const vat = firePremium * (tax / 100);
      return firePremium + vat;
    }
    return 0;
  }

}
