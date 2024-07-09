import { Component, OnInit } from '@angular/core';
import { StudentService } from './student.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrl: './student.component.css'
})
export class StudentComponent implements OnInit {
  students: any;

  constructor(private studentService: StudentService,
    private router: Router,
    private httpClient: HttpClient
  ) {

  }
  ngOnInit(): void {
    this.students = this.studentService.getAllstudent();
  }


}
