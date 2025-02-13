@param int selectedSession
@param java.util.List<csula.i.v.dolphins_swim_academy.model.Student> entries
@template.layout.main(
title="Students",
content = @`
    <form id="sessionForm" action="/students" method="get">
        <div class="d-inline-flex mb-3 mt-3">
            <select id="time" name="session" class="form-select text-secondary-emphasis"  onchange="submitForm()">
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

    @if (entries.isEmpty())
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Level</th>
                <th scope="col">Time (1st Choice)</th>
                <th scope="col">Time (2nd Choice)</th>
            </tr>
            </thead>
        </table>
    @else
        <table class="table table-striped">
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
            @for (int i=0; i<entries.size(); i++)
                @if (entries.get(i).getSession()==selectedSession)
                    <tr class="student-row" data-student-id="${entries.get(i).getid()}">
                        <td>${entries.get(i).getid()}</td>
                        <td>${entries.get(i).getName()}</td>
                        <td>${java.time.Year.now().getValue()-entries.get(i).getBirthyear()}</td>
                        <td>${entries.get(i).getLevel()}</td>
                        <td>${entries.get(i).getTime1()}</td>
                        <td>${entries.get(i).getTime2()}</td>
                    </tr>
                @endif
            @endfor
            </tbody>
        </table>
    @endif
`)
