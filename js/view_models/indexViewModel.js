var indexViewModel = function() {
  var self = this;
  self.showIcons = ko.observable(true);

  self.navigation = {
    dashboard : ko.computed(function() {
      if(!self.showIcons()) return 'Dashboard';
      return '<i class="icon-home"></i> '
    }), 
    patient_records : ko.computed(function() {
      if(!self.showIcons()) return 'Patient Records';
      return '<i class="icon-file"></i> Patient Records'
    }), 
    physician_scheduler : ko.computed(function() {
      if(!self.showIcons()) return 'Physician Scheduler';
      return '<i class="icon-time"></i> Physician Scheduler'
    }), 
    order_tracking : ko.computed(function() {
      if(!self.showIcons()) return 'Orders';
      return '<i class="icon-barcode"></i> Orders'
    }), 
    insurance_billing : ko.computed(function() {
      if(!self.showIcons()) return ' Billing';
      return '<i class="icon-list-alt"></i>  Billing'
    }), 
    equipment_and_inventory : ko.computed(function() {
      if(!self.showIcons()) return 'Equipment';
      return '<i class="icon-tags"></i> Equipment'
    }), 

  }

  self.toggleShowIcons = function() {
    if(self.showIcons()) self.showIcons(false);
    else self.showIcons(true);
  }

  self.setTemplate = function(name) {
    self.currentTemplate(name);
  }
  self.currentTemplate = ko.observable("login");
  console.log(self.currentTemplate());
}

ko.applyBindings(new indexViewModel());

