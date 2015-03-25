####GPX Converter

This app is a utility that allows a user to upload a `csv` file
consisting of up to 150 simple addresses (ex: 1 Main St, Boston, MA) while using Geocoder to geocode the address information. 

The user can then download a file containing the geocoded information, properly formatted as `.gpx` (a type of XML used in modern Garmin devices).

The `.gpx` can then be used to quickly construct optimized delivery routes by importing route information to Garmin BaseCamp, without the need for expensive optimization software.

#####Uploading CSVs
Format: CSV files must have the following headers:
"STNUM" (for street numbers)
"STREET" (for street names)
"CITY" (for city names)

Future renditions of this app will include an area where you can specify your
own state. Currently the system is configured to process MA addresses only.
