# gmaps_data_decoder
Basic decoding of google maps data param


Say you are visiting this lovely url: https://www.google.com/maps/place/Victoria+Theatre/@37.7649179,-122.4210911,17z/data=!3m1!4b1!4m5!3m4!1s0x808f7e2378c6037d:0xdd294d82eb235474!8m2!3d37.7649179!4d-122.4189024

The first two parameters after place are really decorative. They change when zooming in or out, even though the same place is selected. 

Actual data related to the selected place, it's only inside the data param, so to decode the data and getting the info you can do the following: 

```
data = "!4m5!3m4!1s0x808f7e2378c6037d:0xdd294d82eb235474!8m2!3d37.7649179!4d-122.4189024"
assert_equal [
  [
    "0x808f7e2378c6037d:0xdd294d82eb235474",
    [
      "37.7649179",
      "-122.4189024"
    ]
  ]
], Gdata.decode(data)
```


## TODO

Some strings are encoded in a specific way. Still don't know what they mean. 
