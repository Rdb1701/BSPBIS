<?php
include "../header.php";
include "profiles/profile_view.php";

$sql = "SELECT education_id, description FROM tbl_educational_level";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$opt1 = "<select class='form-control' name='newReq2[]' id = 'education_level_child' >";
$opt1 .= "<option value ='' selected hidden>Select Educational Level</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $opt1 .= "<option value='" . $row['education_id'] . "'>" . $row['description'] . "</option>";
}

$opt1 .= "</select>";


$sql = "SELECT education_id, description FROM tbl_educational_level";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$opt2 = "<select class='form-control' name='education_level' id = 'education_level' required>";
$opt2 .= "<option value='' selected hidden>Select Educational Level</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $opt2 .= "<option value='" . $row['education_id'] . "'>" . $row['description'] . "</option>";
}

$opt2 .= "</select>";


$sql = "SELECT barangay_id, name FROM tbl_barangays";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$opt3 = "<select class='form-control' name='barangay' id = 'barangay' required>";
$opt3 .= "<option value='' selected hidden>Select Barangay</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $opt3 .= "<option value='" . $row['barangay_id'] . "'>" . $row['name'] . "</option>";
}

$opt3 .= "</select>";

$sql = "SELECT income_id, description FROM tbl_income_per_month";
$result = mysqli_query($db, $sql) or die("Bad SQL: $sql");

$opt4 = "<select class='form-control' name='income' id = 'income' required>";
$opt4 .= "<option value='' selected hidden>Select Income</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $opt4 .= "<option value='" . $row['income_id'] . "'>" . $row['description'] . "</option>";
}

$opt4 .= "</select>";
?>

<main class="content px-3 py-2">
    <div class="mb-3">
        <h4>Parent Profile</h4>
    </div>
    <div class="content text-dark">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card h-100 mb-lg-0">
                        <div class="card-body table-responsive">
                            <form id="form_profile" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="form-group col-12 col-md-4">
                                        <label>First Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="fname" id="fname" value="<?php echo $fname; ?>" required>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Middle Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="mname" id="mname" value="<?php echo $mname; ?>" required>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Last Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="lname" id="lname" value="<?php echo $lname; ?>" required>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Age<span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" name="age" id="age" required value="<?php echo $age; ?>">
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Birthday<span class="text-danger">*</span></label>
                                        <input type="date" class="form-control" name="bday" id="bday" required value="<?php echo $bday; ?>">
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Gender<span class="text-danger">*</span></label>
                                        <select name="gender" id="gender" class="form-control" required>
                                            <option value="" option hidden>Select Gender</option>
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Barangay<span class="text-danger">*</span></label>
                                        <?php echo $opt3; ?>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Education Level<span class="text-danger">*</span></label>
                                        <?php echo $opt2; ?>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Income per month<span class="text-danger">*</span></label>
                                        <?php echo $opt4; ?>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Phone<span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" name="phone" id="phone" value="<?php echo $phone; ?>" maxlength="11.0" step="0.01" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Email<span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" name="email" id="email" required value="<?php echo $email; ?>">
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Occupation<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="occupation" id="occupation" required value="<?php echo $occupation; ?>">
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Religion<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="religion" id="religion" required value="<?php echo $religion; ?>">
                                    </div>
                                  
                                </div><br>
                                <!-- CHILDRENS -->
                                <div class="row">
                                    <div class="form-group col-12 col-md-12 mb-0">
                                        <label class="d-flex">
                                            List of Descendants &nbsp;
                                            <button type="button" id="btnNew" class="btn btn-primary btn-raised btn-sm ml-auto">
                                                <i class="nav-icon fas fa-plus"></i> add
                                            </button>
                                        </label>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-striped table-hovered" style="overflow-x:auto;">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Name</th>
                                                        <th class="text-center">Age</th>
                                                        <th class="text-center">Educational Level</th>
                                                        <th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="newReq">
                                                    <tr>
                                                        <td class="text-left">
                                                            <input type="text" class="form-control" name="newReq[]" placeholder="Name" >
                                                        </td>
                                                        <td class="text-left">
                                                            <input type="number" class="form-control" name="newReq1[]" placeholder="Age" >
                                                        </td>
                                                        <td class="text-left">
                                                            <?php echo $opt1; ?>
                                                        </td>
                                                        <td class="text-center">-</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" style="float:right;">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<?php
include "../footer.php";
?>

<script>
    var countNew = 1;
    var education = `<?php echo $opt1; ?>`;

    var parent_gender        = `<?php echo $gender; ?>`;
    let my_barangay          = `<?php echo $barangay; ?>`;
    let my_education_level   = `<?php echo $education; ?>`;
    let my_income            = `<?php echo $income; ?>`;
    $('#gender').val(parent_gender)
    $('#barangay').val(my_barangay)
    $('#education_level').val(my_education_level)
    $('#income').val(my_income)




    function remove(id, type) {

        $('#' + type + id).remove()

    }

    $(document).on('click', '#btnNew', function() {

        countNew++
        html = ''
        html += '<tr id="rowNew' + countNew + '">'
        html += '<td class="text-left"><input type="text" class="form-control" name="newReq[]" placeholder="Name"></td>'
        html += '<td class="text-left"><input type="text" class="form-control" name="newReq1[]" placeholder="Age"></td>'
        html += '<td class="text-left">'+ education +'</td>'
        html += '<td class="text-center">'
        html += '<button type="button" onclick="remove(' + countNew + ', \'rowNew\')" class="btn btn-danger btn-raised btn-sm ml-2">'
        html += '<i class="nav-icon fas fa-trash"></i>'
        html += '</button>'
        html += '</td>'
        html += '</tr>'
        $('#newReq').append(html)
    })


    $(document).on('submit', '#form_profile', function(e) {
        e.preventDefault()
        $.ajax({
            url: 'profiles/profile_add',
            method: 'POST',
            data: new FormData($(this)[0]),
            contentType: false,
            processData: false,
            cache: false,
            dataType: 'JSON',
            beforeSend: function() {}
        }).done(function(res) {
            if (res.res_success == 1) {
                alert('Success');
                <?php 
                // session_abort();
                // session_start();
                 ?>
                location.reload();
            } else {
                alert(res.res_message);
            }

        }).fail(function(err) {
            console.log(err)
        })
    })
</script>