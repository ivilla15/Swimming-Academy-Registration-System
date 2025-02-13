package csula.i.v.dolphins_swim_academy.repository;

import csula.i.v.dolphins_swim_academy.model.Student;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface Studentrepo extends CrudRepository<Student, Integer> {
    List<Student> findBySwimClassIsNull();
}
