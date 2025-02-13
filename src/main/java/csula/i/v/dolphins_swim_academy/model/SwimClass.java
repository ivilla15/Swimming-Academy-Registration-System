package csula.i.v.dolphins_swim_academy.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class SwimClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private int session;
    private String time;
    private String level;

    @OneToMany(mappedBy = "swimClass")
    private List<Student> students = new ArrayList<>();

    public SwimClass(int session, String level, String time) {
        this.session = session;
        this.time = time;
        this.level = level;
    }

    public SwimClass() {
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

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void addStudent(Student student) {
        if (student != null) {
            this.students.add(student);
        }
    }
}