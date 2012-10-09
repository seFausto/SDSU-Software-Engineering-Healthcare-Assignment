<?php include "templates/header.php"; ?>

<div class="container" data-bind="template: { name: currentTemplate() }"></div>


<!-- We are inside the container div -->
<script type="text/html" id="login">
    <div class="row" style="margin-top: 100px">
        <div class="span12">
            <div class="alert">
              <button type="button" class="close" data-dismiss="alert">×</button>
              Please login to the HealthTrack system.
            </div>
            <form class="form-horizontal">
              <div class="control-group">
                <label class="control-label" for="inputEmail">ID</label>
                <div class="controls">
                  <input type="text" id="user_id">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="inputPassword">Password</label>
                <div class="controls">
                  <input type="password" id="inputPassword">
                </div>
              </div>
              <div class="control-group">
                <div class="controls">
                  <label class="checkbox">
                    <input type="checkbox"> Remember me
                  </label>
                  <button class="btn btn-primary">Login</button>
                </div>
              </div>
            </form>
        </div>
    </div>
</script>

<script type="text/html" id="patient_records">
    <div class="row" style="margin-top: 100px">
        Viewing patient records
    </div>
</script>

<script type="text/html" id="equipment">
    <div class="row" style="margin-top: 100px">
        Viewing Equipment and Inventory
    </div>
</script>

<script type="text/html" id="pharmacy_orders">
    <div class="row" style="margin-top: 100px">
        Viewing Pharmacy order tracking
    </div>
</script>
<script type="text/html" id="lab_orders">
    <div class="row" style="margin-top: 100px">
        Viewing Lab order tracking
    </div>
</script>

<script type="text/html" id="billing">
    <div class="row" style="margin-top: 100px">
        Viewing Insurance Billing
    </div>
</script>
<script type="text/html" id="physician_scheduler">
    <div class="row" style="margin-top: 100px">
        Viewing Physician Scheduler
    </div>
</script>
<!-- Container is closed in footer.php -->


<?php include "templates/footer.php"; ?>