@param int selectedSession

@param java.util.List<csula.i.v.dolphins_swim_academy.model.SwimClass> classesList
@param java.util.List<csula.i.v.dolphins_swim_academy.model.Student> entries
@template.layout.main(
title="Classes",
content = @`
    <form id="sessionForm" action="/classes" method="get">
        <div class="d-inline-flex mb-3 mt-3">
            <select id="time" name="session" class="form-select text-secondary-emphasis" onchange="submitForm()">
                <option value="1" selected="${selectedSession == 1}">Session 1: June 17 - June 27</option>
                <option value="2" selected="${selectedSession == 2}">Session 2: July 8 - July 18</option>
                <option value="3" selected="${selectedSession == 3}">Session 3: July 22 - August 1</option>
                <option value="4" selected="${selectedSession == 4}">Session 4: August 5 - August 15</option>
            </select>
        </div>
    </form>

    <script>
        function submitForm() {
            document.getElementById("sessionForm").submit();
        }
    </script>

    @if (classesList.isEmpty())
        <div class="alert alert-info" role="alert">
            Unfortunately there are no classes available for this section at the moment. Please check again later for any new classes.
        </div>
    @else
        @for (int i=0; i<classesList.size(); i++)
            @if (classesList.get(i).getSession()==selectedSession)
                <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
                <label for="classes" class="text-primary-emphasis mb-4" style="font-size: 20px">Class</label>
                <table id="classes" class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Time</th>
                        <th scope="col">Level</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${classesList.get(i).getTime()}</td>
                        <td>${classesList.get(i).getLevel()}</td>
                    </tr>
                    </tbody>
                </table>
                <br>

                <label for="students" class="text-primary-emphasis mb-4" style="font-size: 20px">Students</label>
                <table id="students" class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Age</th>
                            <th scope="col">Level</th>
                            <th scope="col">Time (1st Choice)</th>
                            <th scope="col">Time (2nd Choice)</th>
                        </tr>
                    </thead>
                <tbody>
                @for (int a=0; a<classesList.get(i).getStudents().size(); a++)
                        <tr>
                            <td>${classesList.get(i).getStudents().get(a).getid()}</td>
                            <td>${classesList.get(i).getStudents().get(a).getName()}</td>
                            <td>${java.time.Year.now().getValue()-classesList.get(i).getStudents().get(a).getBirthyear()}</td>
                            <td>${classesList.get(i).getStudents().get(a).getLevel()}</td>
                            <td>${classesList.get(i).getStudents().get(a).getTime1()}</td>
                            <td>${classesList.get(i).getStudents().get(a).getTime2()}</td>
                        </tr>
                @endfor
                <br>
                </tbody>
                </table>
                    <a class="btn btn-primary mt-4"
                       href="/addstudents?classId=${classesList.get(i).getId()}"
                       role="button">
                        Add Students
                        <i class="bi bi-plus"></i>
                    </a>
                <br>
                </div>
                <br>
            @endif
        @endfor
    @endif
    <a class="btn btn-primary mt-4" href="/addclass" role="button">
        Add Class
        <i class="bi bi-plus"></i>
    </a>
`)