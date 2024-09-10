import { Component, OnInit } from '@angular/core';
import { PolicyService } from '../../service/policy.service';
import { Router } from '@angular/router';



@Component({
  selector: 'app-policy',
  templateUrl: './policy.component.html',
  styleUrls: ['./policy.component.css']
})
export class PolicyComponent implements OnInit {
  policies: any;


  constructor(
    private policyService: PolicyService,
    private router: Router
    
  ) { }

  ngOnInit(): void {
    this.policies = this.policyService.viewAllPolicy();

  }
  deletePolicy(id: number) {
    this.policyService.deletePolicy(id)
      .subscribe({
        next: () => {
          // Handle successful deletion
          console.log('Policy deleted successfully');
  
          // Refresh the list of policies
          this.policyService.viewAllPolicy().subscribe({
            next: (data) => {
              this.policies = data; // Update the policies array with the refreshed data
              console.log('Policies refreshed');
              this.router.navigate(['viewpolicy']);
            },
            error: (err) => {
              console.error('Error refreshing policies', err);
            }
          });
        },
        error: (error) => {
          console.error('Error deleting policy', error);
        }
      });
  }
  

  editPolicy(id: string) {
    this.router.navigate(['updatepolicy', id]);
  }

  navigateToAddPolicy() {
    this.router.navigateByUrl('/createpolicy');
  }


}
