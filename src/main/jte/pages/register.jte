@param boolean success

@template.layout.main(
title="Register",
content = @`
    @if (success)
        <div class="alert alert-success" role="alert">
            Thank you for registering for our summer swimming lessons! An administrator will contact you shortly to confirm your classes.
        </div>
    @else
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mt-3">
                <li class="breadcrumb-item active" aria-current="page">Register</li>
            </ol>
        </nav>
        <form id="registrationForm" class="mt-3" method="post">
            <div class="row">
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label for="Session" class="form-label">Session</label>
                    <select id="Session" name="session" class="form-select" required>
                        <option value="1">Session 1: June 17 - June 27</option>
                        <option value="2">Session 2: July 8 - July 18</option>
                        <option value="3">Session 3: July 22 - August 1</option>
                        <option value="4">Session 4: August 5 - August 15</option>
                    </select>
                </div>
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label for="Level" class="form-label">Level</label>
                    <select id="Level" name="level" class="form-select" required>
                        <option value="Starfish">Starfish</option>
                        <option value="Minnows">Minnows</option>
                        <option value="Guppies">Guppies</option>
                        <option value="Dolphins">Dolphins</option>
                    </select>
                </div>
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label for="name" class="form-label">Name</label>
                    <input id="name" type="text" name="name" class="form-control" required />
                </div>
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label for="birthYear" class="form-label">Birth Year</label>
                    <input id="birthYear" type="number" name="birthyear" class="form-control" required />
                </div>
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label class="mb-1" for="time1">Time (1st Choice)</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time1" id="time1_9am" value="9am" required />
                        <label class="form-check-label" for="time1_9am">9am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time1" id="time1_10am" value="10am" />
                        <label class="form-check-label" for="time1_10am">10am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time1" id="time1_1pm" value="1pm" />
                        <label class="form-check-label" for="time1_1pm">1pm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time1" id="time1_2pm" value="2pm" />
                        <label class="form-check-label" for="time1_2pm">2pm</label>
                    </div>
                </div>
                <div class="mb-3 col-12 col-sm-6 col-lg-6">
                    <label class="mb-1" for="time2">Time (2nd Choice)</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time2" id="time2_9am" value="9am" required />
                        <label class="form-check-label" for="time2_9am">9am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time2" id="time2_10am" value="10am" />
                        <label class="form-check-label" for="time2_10am">10am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time2" id="time2_1pm" value="1pm" />
                        <label class="form-check-label" for="time2_1pm">1pm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="time2" id="time2_2pm" value="2pm" />
                        <label class="form-check-label" for="time2_2pm">2pm</label>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const time1Radios = document.querySelectorAll('input[name="time1"]');
                const time2Radios = document.querySelectorAll('input[name="time2"]');

                // Disable the corresponding time in time2 if selected in time1
                time1Radios.forEach((radio) => {
                    radio.addEventListener('change', function() {
                        const selectedTime = this.value;

                        // Uncheck and disable the same time in time2
                        time2Radios.forEach((time2Radio) => {
                            if (time2Radio.value === selectedTime) {
                                time2Radio.disabled = true;
                                time2Radio.checked = false; // Uncheck it if selected
                            } else {
                                time2Radio.disabled = false; // Re-enable the other times
                            }
                        });
                    });
                });

                // Disable the corresponding time in time1 if selected in time2
                time2Radios.forEach((radio) => {
                    radio.addEventListener('change', function() {
                        const selectedTime = this.value;

                        // Uncheck and disable the same time in time1
                        time1Radios.forEach((time1Radio) => {
                            if (time1Radio.value === selectedTime) {
                                time1Radio.disabled = true;
                                time1Radio.checked = false; // Uncheck it if selected
                            } else {
                                time1Radio.disabled = false; // Re-enable the other times
                            }
                        });
                    });
                });
            });
        </script>
    @endif
`)