@param csula.i.v.dolphins_swim_academy.model.SwimClass classes
@param java.util.List<csula.i.v.dolphins_swim_academy.model.Student> unassignedstudents
@template.layout.main(
title="Assign Students",
content = @`
    @if (unassignedstudents.isEmpty())
        <div class="alert alert-info" role="alert">
            Unfortunately there are no students available for this class at the moment. Please check again later for any new students.
        </div>
    @else
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Add</th>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Level</th>
                <th scope="col">Time (1st Choice)</th>
                <th scope="col">Time (2nd Choice)</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            </tr>
            @for (int i=0; i<unassignedstudents.size(); i++)
                @if (unassignedstudents.get(i).getLevel().equals(classes.getLevel()) &&
                    (unassignedstudents.get(i).getTime1().equals(classes.getTime()) ||
                    unassignedstudents.get(i).getTime2().equals(classes.getTime())) &&
                    unassignedstudents.get(i).getSession() == classes.getSession())
                    <tr>
                        <td>
                            <form action="/registerStudent" method="post">
                                <input type="hidden" name="classId" value="${classes.getId()}"> <!-- Add classId -->
                                <input type="hidden" name="studentId" value="${unassignedstudents.get(i).getid()}"> <!-- Add studentId -->
                                <input class="btn btn-primary" type="submit" value="Add Student">
                            </form>
                        </td>
                        <td>${unassignedstudents.get(i).getid()}</td>
                        <td>${unassignedstudents.get(i).getName()}</td>
                        <td>${java.time.Year.now().getValue() - unassignedstudents.get(i).getBirthyear()}</td>
                        <td>${unassignedstudents.get(i).getLevel()}</td>
                        <td>${unassignedstudents.get(i).getTime1()}</td>
                        <td>${unassignedstudents.get(i).getTime2()}</td>
                    </tr>
                @endif
            @endfor
            </tbody>
        </table>
    @endif
`)
