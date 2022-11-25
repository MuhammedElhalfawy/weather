String weatherImage(int condition) {
  // check weather id from the server and return the specific image
  late String assetImage;
  if (condition < 300) {
    if (condition < 210 || (condition > 230 && condition < 233)) {
      assetImage = 'assets/images/17.png';
    } else if (condition < 220) {
      assetImage = 'assets/images/12.png';
    }
  } else if (condition < 400) {
    assetImage = 'assets/images/7.png';
  } else if (condition < 600) {
    assetImage = 'assets/images/39.png';
  } else if (condition < 700) {
    assetImage = 'assets/images/18.png';
  } else if (condition < 800) {
    if (condition == 781) {
      assetImage = 'assets/images/5.png';
    }
    assetImage = 'assets/images/22.png';
  } else if (condition == 800) {
    assetImage = 'assets/images/26.png';
  } else if (condition < 805) {
    assetImage = 'assets/images/27.png';
  }
  return assetImage;
}