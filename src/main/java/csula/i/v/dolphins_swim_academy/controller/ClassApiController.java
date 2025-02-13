package csula.i.v.dolphins_swim_academy.controller;

import csula.i.v.dolphins_swim_academy.model.Student;
import csula.i.v.dolphins_swim_academy.model.StudentDto;
import csula.i.v.dolphins_swim_academy.model.SwimClass;
import csula.i.v.dolphins_swim_academy.model.SwimClassDto;
import csula.i.v.dolphins_swim_academy.repository.Studentrepo;
import csula.i.v.dolphins_swim_academy.repository.SwimClassrepo;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/classes")
public class ClassApiController {
    private final SwimClassrepo swimclassRepository;
    private final Studentrepo studentRepository;

    public ClassApiController(SwimClassrepo swimclassRepository, Studentrepo studentRepository) {
        this.swimclassRepository = swimclassRepository;
        this.studentRepository = studentRepository;
    }

    @GetMapping("/{id}")
    public SwimClassDto getSwimClassById(@PathVariable int id) {
        SwimClass swimClass = swimclassRepository.findById(id).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Swim class not found"));

        List<StudentDto> studentDtos = swimClass.getStudents().stream()
                .map(student -> new StudentDto(student))
                .collect(Collectors.toList());

        SwimClassDto swimClassDto = new SwimClassDto(swimClass);
        swimClassDto.setStudents(studentDtos);

        return swimClassDto;
    }

    @GetMapping("/session/{session}")
    public List<SwimClassDto> getSwimClassesBySession(@PathVariable int session) {
        List<SwimClass> swimClasses = swimclassRepository.findBySession(session);

        if (swimClasses.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No swim classes found for session " + session);
        }

        return swimClasses.stream()
                .map(swimClass -> {
                    SwimClassDto dto = new SwimClassDto(swimClass);
                    dto.setNumberOfStudents(swimClass.getStudents().size());
                    return dto;
                })
                .collect(Collectors.toList());
    }

    @PostMapping
    public SwimClassDto createSwimClass(@RequestBody SwimClassDto swimClassDto) {
        SwimClass swimClass = swimClassDto.toSwimClass();
        SwimClass savedSwimClass = swimclassRepository.save(swimClass);
        return new SwimClassDto(savedSwimClass);
    }

    @PostMapping("/{classId}/students")
    public SwimClassDto addStudentToClass(@PathVariable int classId, @RequestBody StudentDto studentDto) {
        SwimClass swimClass = swimclassRepository.findById(classId).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Swim class not found"));

        Student newStudent = studentDto.toStudent();
        swimClass.getStudents().add(newStudent);
        SwimClass updatedSwimClass = swimclassRepository.save(swimClass);
        return new SwimClassDto(updatedSwimClass);
    }
}

