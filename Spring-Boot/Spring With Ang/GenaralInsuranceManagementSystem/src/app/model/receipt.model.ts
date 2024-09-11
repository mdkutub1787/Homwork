
import { BillModel } from "./bill.model";
import { PolicyModel } from "./policy.model";

export class ReceiptModel {
    id!: number;
    
    fireBill!: BillModel;
    firePolicy!: PolicyModel;
}
