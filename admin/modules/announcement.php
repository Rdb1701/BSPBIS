<?php include "../header.php"; ?>

<main class="content px-3 py-2">
    <div class="page-heading">
        <h3 class="">Barangay Activities</h3>
    </div>
    <br>
    <div>
        <button onclick="add_activity()" data-toggle="modal" class="btn btn-primary" type="button"><i class="fa fa-plus"></i> Add Activity</button>
    </div><br>
    <div class="page-content">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="myTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="text-center">Description</th>
                                <th class="text-center">Purpose</th>
                                <th class="text-center">Date Created</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!------------------------- CONTENT TABLE ------------------------------>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
<?php include "../footer.php"; ?>
<?php include "modal/modal_announcements.php"; ?>

<script>
    function add_activity() {
        $('#add_modal').modal({
            backdrop: 'static',
            keyboard: false
        })
        $('#add_modal').modal('show');
    }

    function delete_activity(activity_id) {
        if (confirm("Are you sure you want to remove descendant?")) {
            $.ajax({
                url: 'announcements/delete',
                type: 'POST',
                data: {
                    activity_id: activity_id

                },
                dataType: 'JSON',
                beforeSend: function() {

                }
            }).done(function(res) {
                if (res.res_success == 1) {
                    alert('Successfully Deleted');

                    location.reload();

                } else {
                    alert(res.res_message);
                }
            }).fail(function() {
                console.log("FAIL");
            })
        }
    }

    function edit_activity(activity_id) {
      $.ajax({
        url: 'announcements/edit',
        type: 'POST',
        data: {
            activity_id: activity_id

        },
        dataType: 'JSON',
        beforeSend: function() {

        }
      }).done(function(res) {

        $("#edit_id").val(res.activity_id);
        $("#edit_desc").val(res.activity_desc);
        $("#edit_purpose").val(res.purpose);
        $("#edit_date").val(res.date_inserted);
        $('#edit_modal').modal({
            backdrop: 'static',
            keyboard: false
        })
        $('#edit_modal').modal('show');

      }).fail(function() {
        console.log("FAIL");
      })
    }


    $(document).ready(function() {

        var table = $('#myTable').DataTable({
            ajax: 'announcements/view', // API endpoint to fetch data
            columns: [{
                    data: [0],
                    "className": "text-center"
                },
                {
                    data: [1],
                    "className": "text-center"
                },
                {
                    data: [2],
                    "className": "text-center"
                },
                {
                    data: [3],
                    "className": "text-center"
                }
            ]

        });


        $('#form_announcement').submit(function(e) {
            e.preventDefault();

            let description = $('#add_desc').val()
            let purpose     = $('#add_purpose').val()
            let date        = $('add_date').val()

            $.ajax({
                url: 'announcements/add',
                type: 'POST',
                data: {
                    description : description,
                    purpose     : purpose,
                    date        : date
                },
                dataType: 'JSON',
                beforeSend: function() {

                }
            }).done(function(res) {
                if (res.res_success == 1) {
                    swal("Success Added", "", "success");
                    var currentPageIndex = table.page.info().page;
                    table.ajax.reload(function() {
                        table.page(currentPageIndex).draw(false);
                    }, false);
                    $('#add_modal').modal('hide');
                } else {
                    alert(res.res_message);
                }
            }).fail(function() {
                console.log("FAIL");
            })
        })


    })
</script>