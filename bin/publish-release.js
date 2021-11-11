import shell from 'shelljs';
import { opts } from '../util/index.js';

const version = opts.release;
const image = process.env.IMAGE;

shell.echo(`Preparing version: ${version}`);

let r = shell.exec(`docker manifest push ${image}:${version}`);
if (r.code) {
  shell.exit(1);
}
