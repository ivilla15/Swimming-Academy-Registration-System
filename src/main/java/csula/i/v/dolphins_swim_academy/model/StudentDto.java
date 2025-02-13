package csula.i.v.dolphins_swim_academy.model;

public class StudentDto {

    private Integer id;
    private String name;
    private int session;
    private int birthYear;
    private String level;
    private String time1;
    private String time2;

    public StudentDto() {
    }

    public StudentDto(Student e) {
        id = e.getid();
        name = e.getName();
        session = e.getSession();
        birthYear = e.getBirthyear();
        level = e.getLevel();
        time1 = e.getTime1();
        time2 = e.getTime2();
    }

    public Student toStudent() {
        Student e = new Student();
        e.setId(id);
        e.setName(name);
        e.setSession(session);
        e.setBirthyear(birthYear);
        e.setTime1(time1);
        e.setTime2(time2);
        return e;
    }

    // Getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getTime1() {
        return time1;
    }

    public void setTime1(String time1) {
        this.time1 = time1;
    }

    public String getTime2() {
        return time2;
    }

    public void setTime2(String time2) {
        this.time2 = time2;
    }
}