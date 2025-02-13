@param boolean success
@param csula.i.v.dolphins_swim_academy.model.SwimClass classes

@template.layout.main(
title="New Class",
content = @`
    @if (success)
        <div class="alert alert-success" role="alert">
            You have successfully added a new class. Would you like to add students?
            <br>
            <a class="btn btn-success mt-4" href="/addstudents?classId=${classes.getId()}" role="button">
                Add Students <i class="bi bi-plus-square"></i>
            </a>
        </div>
    @else
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mt-3">
                <li class="breadcrumb-item active text-primary-emphasis" aria-current="page">Add Class</li>
            </ol>
        </nav>
        <form id="registrationForm" class="mt-3" method="post">
            <div class="row">
                <div class="mb-3 col-s-12 col-lg-6">
                    <label for="Session" class="form-label">Session</label>
                    <select id="Session" name="session" class="form-select" required>
                        <option value="1">Session 1: June 17 - June 27</option>
                        <option value="2">Session 2: July 8 - July 18</option>
                        <option value="3">Session 3: July 22 - August 1</option>
                        <option value="4">Session 4: August 5 - August 15</option>
                    </select>
                </div>
                <div class="mb-3 col-s-12 col-lg-6">
                    <label for="Level" class="form-label">Level</label>
                    <select id="Level" name="level" class="form-select" required>
                        <option value="Starfish">Starfish</option>
                        <option value="Minnows">Minnows</option>
                        <option value="Guppies">Guppies</option>
                        <option value="Dolphins">Dolphins</option>
                    </select>
                </div>
                <div class="mb-3 col-s-12 col-lg-6">
                    <label class="mb-1" for="time">Time</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time" id="time_9am" value="9am" required />
                        <label class="form-check-label" for="time_9am">9am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time" id="time_10am" value="10am" />
                        <label class="form-check-label" for="time_10am">10am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time" id="time_1pm" value="1pm" />
                        <label class="form-check-label" for="time_1pm">1pm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time" id="time_2pm" value="2pm" />
                        <label class="form-check-label" for="time_2pm">2pm</label>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    @endif
`)