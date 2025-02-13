package csula.i.v.dolphins_swim_academy.controller;

import csula.i.v.dolphins_swim_academy.model.SwimClass;
import csula.i.v.dolphins_swim_academy.model.Student;
import csula.i.v.dolphins_swim_academy.repository.Studentrepo;
import csula.i.v.dolphins_swim_academy.repository.SwimClassrepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    private final Studentrepo studentrepo;
    private final SwimClassrepo swimclassrepo;

    public IndexController(Studentrepo studentrepo, SwimClassrepo swimclassrepo) {
        this.studentrepo = studentrepo;
        this.swimclassrepo = swimclassrepo;
    }

    @GetMapping("/")
    public String home(Model model) {
        return "pages/home";
    }

    @RequestMapping("/students")
    public String students(Integer session, Model model) {
        if (session == null) {
            session=1;
        }
        model.addAttribute("selectedSession", session);
        model.addAttribute("entries", studentrepo.findAll());
        return "pages/students";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("success", false);
        return "pages/register";
    }

    @PostMapping("/register")
    public String register(String name, int session, int birthyear, String level, String time1, String time2, Model model) {
        Student newStudent = new Student(name, session, birthyear, level, time1, time2);
        studentrepo.save(newStudent);

        model.addAttribute("success", true); // Add success message to the model
        return "pages/register"; // Return to the registration page
    }

    @RequestMapping("/classes")
    public String classes(Integer session, Model model) {
        if (session == null) {
            session = 1;  // Default to session 1 if no session is provided
        }

        // Fetch the classes for the selected session from the repository
        List<SwimClass> classesList = swimclassrepo.findBySession(session);

        // Ensure that the classesList is never null. If no classes are found, initialize it as an empty list.
        if (classesList == null) {
            classesList = new ArrayList<>();
        }

        // Fetch all students from the student repository
        List<Student> entries = (List<Student>) studentrepo.findAll();

        // Add attributes to the model to pass them to the view
        model.addAttribute("selectedSession", session);
        model.addAttribute("classesList", classesList);  // Pass the classesList to the template
        model.addAttribute("entries", entries);  // Pass the list of students to the template

        // Return the "classes" page to render the view
        return "pages/classes";
    }


    @GetMapping("/addclass")
    public String addclass(Model model) {
        model.addAttribute("success", false);
        return "pages/addclass";
    }

    @PostMapping("/addclass")
    public String addclass(Integer id, int session, String time, String level, Model model) {
        SwimClass newClass = new SwimClass(session, level, time);
        swimclassrepo.save(newClass);

        model.addAttribute("success", true);
        model.addAttribute("classes", newClass);
        return "pages/addclass";
    }

    @RequestMapping("/addstudents")
    public String addstudents(Integer classId, Model model) {
        SwimClass swimClass = swimclassrepo.findById(classId).orElse(null);
        if (swimClass == null) {
            model.addAttribute("error", "SwimClass not found.");
            return "pages/addstudents";
        }

        List<Student> unassignedStudents = studentrepo.findBySwimClassIsNull();  // Get unassigned students
        model.addAttribute("classes", swimClass);
        model.addAttribute("unassignedstudents", unassignedStudents);

        return "pages/addstudents";
    }


    @PostMapping("/registerStudent")
    public String registerStudent(@RequestParam Integer classId, @RequestParam Integer studentId, Model model) {
        // Fetch the class using classId
        SwimClass swimClass = swimclassrepo.findById(classId).orElse(null);

        if (swimClass == null) {
            model.addAttribute("error", "Class not found.");
            return "pages/addstudents";  // If the class is not found, return an error page
        }

        // Fetch the student using studentId
        Student student = studentrepo.findById(studentId).orElse(null);

        if (student == null) {
            model.addAttribute("error", "Student not found.");
            return "pages/addstudents";  // If the student is not found, return an error page
        }

        // Set the SwimClass for the student
        student.setSwimClass(swimClass);

        // Add the student to the class's student list
        swimClass.addStudent(student);

        // Save the updated student and class in the database
        studentrepo.save(student);  // Save the student with the assigned swimClass
        swimclassrepo.save(swimClass);  // Save the class with the updated student list

        model.addAttribute("success", true);
        return "redirect:/classes?session=" + swimClass.getSession(); // Redirect back to the classes page
    }



}
