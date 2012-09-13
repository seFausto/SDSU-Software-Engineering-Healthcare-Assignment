var indexViewModel = function() {
  var self = this;
  self.showIcons = ko.observable(true);

  self.navigation = {
    dashboard : ko.computed(function() {
      if(!self.showIcons()) return 'Dashboard';
      return '<i class="icon-home"></i> Dashboard'
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
      if(!self.showIcons()) return 'Order Tracking';
      return '<i class="icon-barcode"></i> Order Tracking'
    }), 
    insurance_billing : ko.computed(function() {
      if(!self.showIcons()) return 'Insurance Billing';
      return '<i class="icon-list-alt"></i> Insurance Billing'
    }), 
    equipment_and_inventory : ko.computed(function() {
      if(!self.showIcons()) return 'Equipment and Inventory';
      return '<i class="icon-tags"></i> Equipment and Inventory'
    }), 

  }

  self.toggleShowIcons = function() {
    if(self.showIcons()) self.showIcons(false);
    else self.showIcons(true);
  }
}

ko.applyBindings(new indexViewModel());

