<div class="container">
  <div class="row" style="margin-top: 100px">
      <div class="span12">
        <?php if(!isset($error) || !$error) { ?>
          <div class="alert">
            <button type="button" class="close" data-dismiss="alert">×</button>
            Please login to the HealthTrak system.
          </div>
        <?php } else if(isset($error) && $error) { ?>
          <div class="alert alert-danger">
              <button type="button" class="close" data-dismiss="alert">×</button>
              <?php echo $error; ?>
            </div>
        <?php } ?>
            <form class="form form-horizontal" method="POST" action="<?php echo base_url();?>index.php/login">

            <div class="control-group">
              <label class="control-label" for="inputEmail" >ID</label>
              <div class="controls">
                <input type="text" id="user_id" name="ID" value="<?php if($this->input->post('ID')) echo $this->input->post('ID');?>"> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">Password</label>
              <div class="controls">
                <input type="password" id="inputPassword" name="password">
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <!-- <label class="checkbox">
                  <input type="checkbox">Remember me
                </label> -->
                <button class="btn btn-primary">Login</button>
              </div>
            </div>
          </form>
      </div>
  </div>
</div>
