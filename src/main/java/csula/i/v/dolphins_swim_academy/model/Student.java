package csula.i.v.dolphins_swim_academy.model;

import jakarta.persistence.*;

@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private int session;
    private int birthyear;
    private String level;
    private String time1;
    private String time2;

    @JoinColumn(name = "swim_class_id")
    @ManyToOne
    private SwimClass swimClass;  // This is the reference to SwimClass

    public SwimClass getSwimClass() {
        return swimClass;
    }

    public void setSwimClass(SwimClass swimClass) {
        this.swimClass = swimClass;
    }

    public Student(String name, int session, int birthyear, String level, String time1, String time2) {
        this.name = name;
        this.session = session;
        this.birthyear = birthyear;
        this.level = level;
        this.time1 = time1;
        this.time2 = time2;
    }

    public Student() {
    }

    public String getTime2() {
        return time2;
    }

    public String getTime1() {
        return time1;
    }

    public String getLevel() {
        return level;
    }

    public int getBirthyear() {
        return birthyear;
    }

    public int getSession() {
        return session;
    }

    public String getName() {
        return name;
    }

    public Integer getid() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSession(int session) {
        this.session = session;
    }

    public void setBirthyear(int birthyear) {
        this.birthyear = birthyear;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setTime1(String time1) {
        this.time1 = time1;
    }

    public void setTime2(String time2) {
        this.time2 = time2;
    }
}
