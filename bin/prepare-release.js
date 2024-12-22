import shell from 'shelljs';
import { opts } from '../util/index.js';

const version = opts.release;
const image = process.env.IMAGE;

shell.echo(`Preparing version: ${version}`);

let r = shell.exec(`docker manifest create ${image}:${version} ${image}:linux ${image}:windows-2019 ${image}:windows-2022 ${image}:windows-2025`);
if (r.code) {
  shell.exit(1);
}

r = shell.exec(`docker manifest inspect ${image}:${version}`);
if (r.code) {
  shell.exit(1);
}
