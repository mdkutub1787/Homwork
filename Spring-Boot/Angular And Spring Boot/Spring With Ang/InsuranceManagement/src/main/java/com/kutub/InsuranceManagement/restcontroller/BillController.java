package com.kutub.InsuranceManagement.restcontroller;

import com.kutub.InsuranceManagement.entity.Bill;
import com.kutub.InsuranceManagement.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("api/bill")
@CrossOrigin("*")
public class BillController {

    @Autowired
    private BillService billService;


    @GetMapping("/")
    public List<Bill> getAllBills() {
        return billService.getAllBill();
    }



    @PostMapping("/save")
    public void saveBill(@RequestBody Bill b) {
        billService.saveBill(b);
    }


    @PutMapping("/update/{id}")
    public  void updateBill(@RequestBody Bill b){
        billService.saveBill(b);
    }


    @DeleteMapping("/delete/{id}")
    public void deleteBillById(@PathVariable int id) {
        billService.deleteBill(id);
    }

    @GetMapping("/{id}")
    public Bill getBillById(@PathVariable ("id") int id){
        return   billService.findById(id);
    }

    @GetMapping("/searchpolicyholder")
    public List<Bill> findBillsByPolicyholder(@RequestParam String policyholder) {
        return billService.findByPolicyHolderName(policyholder);
    }
}
