package csula.i.v.dolphins_swim_academy.repository;

import csula.i.v.dolphins_swim_academy.model.Student;
import csula.i.v.dolphins_swim_academy.model.SwimClass;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SwimClassrepo extends CrudRepository<SwimClass, Integer> {
    List<SwimClass> findBySession(int session);

    List<SwimClass> findByStudentsContaining(Student student);
}
