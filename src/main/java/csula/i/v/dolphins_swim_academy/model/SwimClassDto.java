package csula.i.v.dolphins_swim_academy.model;

import java.util.List;
import java.util.stream.Collectors;

public class SwimClassDto {

    private Integer id;
    private int session;
    private String time;
    private String level;
    private List<StudentDto> students;
    private int numberOfStudents;

    public SwimClassDto() {
    }

    public SwimClassDto(SwimClass swimClass) {
        this.id = swimClass.getId();
        this.session = swimClass.getSession();
        this.time = swimClass.getTime();
        this.level = swimClass.getLevel();
        this.students = swimClass.getStudents().stream()
                .map(StudentDto::new)
                .collect(Collectors.toList());
        this.numberOfStudents = swimClass.getStudents().size();
    }

    public SwimClass toSwimClass() {
        SwimClass e = new SwimClass();
        e.setId(id);
        e.setSession(session);
        e.setTime(time);
        e.setLevel(level);
        e.setStudents(students.stream().map(StudentDto::toStudent).collect(Collectors.toList()));
        return e;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public List<StudentDto> getStudents() {
        return students;
    }

    public void setStudents(List<StudentDto> students) {
        this.students = students;
    }

    public int getNumberOfStudents() {
        return numberOfStudents;
    }

    public void setNumberOfStudents(int numberOfStudents) {
        this.numberOfStudents = numberOfStudents;
    }
}
