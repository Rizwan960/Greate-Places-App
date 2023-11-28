const googleApiKey = 'AIzaSyAWznVbBV9XTv5SmAfq5OVoRdE38xieWHQ';

class LocationHelper {
  static String generatedLocationPrivewImage(
      {double? longitude, double? latitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$longitude,$latitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$longitude,$latitude&key=$googleApiKey'; //&signature=vAHWC44hMVoYOrftone4oUBWbZ0';

    //"https://maps.googleapis.com/maps/api/staticmap?center=&$longitude,$latitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$longitude,$latitude&key=$googleApiKey"; //&signature=YOUR_SIGNATURE";
  }
}
