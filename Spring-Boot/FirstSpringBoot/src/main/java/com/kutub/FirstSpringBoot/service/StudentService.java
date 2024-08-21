package com.kutub.FirstSpringBoot.service;


import com.kutub.FirstSpringBoot.entity.Student;
import com.kutub.FirstSpringBoot.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public void saveStudent(Student s) {

        studentRepository.save(s);
    }

    public List<Student> getAllStudent() {
        return studentRepository.findAll();

    }

    public void deleteStudentById(int id) {
        studentRepository.deleteById(id);
    }

    public Student findStudentById(int id) {
        return studentRepository.findById(id).get();
    }

}
