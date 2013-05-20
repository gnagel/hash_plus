hash_plus
=========

Extensions to the Ruby Hash class

```ruby

my_vehicle = {
	:make  => 'Subaru',
	:model => 'Forester',
	:year  => 2525,
}

my_vehicle.requires_fields(:make, :model) # No errors

my_vehicle.requires_fields(:mileage) # Raises Argument error

my_vehicle[:mileage] = nil
my_vehicle.requires_fields(:mileage) # Raises Argument error

my_vehicle[:mileage] = 40_000
my_vehicle.requires_fields(:mileage) # No errors
```
