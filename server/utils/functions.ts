import formidable from 'formidable';
import crpyto from 'crypto';
import mv from 'mv';
import path from 'path';

/**
 * @returns Secure 6 digit random number
 */
const generateSixDigitRandomNumber = (): number => {
  return crpyto.randomInt(100000, 999999);
};

/**
 * Moves formidable file to specified path
 * @param file formidable file object uploaded by user
 * @param dir the directory where to move the file to
 * @param filename the new name of the file
 * @returns file path where the file has been moved to
 */
const moveFromTemp = async (
  file: formidable.File,
  dir: string,
  filename: string
) => {
  const dest = path.join(__dirname, dir, filename);

  mv(file.filepath, dest, { mkdirp: true }, () => {
    // Do Nothing
  });

  return dest;
};

/**
 * Gives current date & time in string format
 * @returns String of pattern dd/mm/yyyy HH:mm
 */
function getCurrentDateTimeAsString(): string {
  const currentDate = new Date();
  const day = currentDate.getDate().toString().padStart(2, '0');
  const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
  const year = currentDate.getFullYear().toString();
  const hours = currentDate.getHours().toString().padStart(2, '0');
  const minutes = currentDate.getMinutes().toString().padStart(2, '0');
  const formattedDateTime = `${day}/${month}/${year} ${hours}:${minutes}`;
  return formattedDateTime;
}

/**
 * calculateDistance (Haversine Formula)
 * @param coordinateOne takes lat, lng
 * @param coordinateTwo takes lat, lng
 * @param radius radius in metre to check if the distance between them is less than radius
 * @returns boolean of whether two coordinates are within radius
 */
function withinGeoRadius(
  coordinateOne: [number, number],
  coordinateTwo: [number, number],
  radius: number
): boolean {
  const R = 6371e3; // Earth radius in meters
  const φ1 = (coordinateOne[0] * Math.PI) / 180; // φ, λ in radians
  const φ2 = (coordinateTwo[0] * Math.PI) / 180;
  const Δφ = ((coordinateTwo[0] - coordinateOne[0]) * Math.PI) / 180;
  const Δλ = ((coordinateTwo[1] - coordinateOne[1]) * Math.PI) / 180;

  const a =
    Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
    Math.cos(φ1) * Math.cos(φ2) * Math.sin(Δλ / 2) * Math.sin(Δλ / 2);

  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

  const distance = R * c; // Distance in meters
  return distance <= radius;
}

export {
  generateSixDigitRandomNumber,
  moveFromTemp,
  getCurrentDateTimeAsString,
  withinGeoRadius
};
