import { Command } from 'commander';

const program = new Command();
program.version('0.0.1').requiredOption('-r, --release <type>', 'Version to use').option('-s, --sha <type>', 'Sha to use').option('-d, --dry-run');

program.parse(process.argv);

const opts = program.opts();

export { opts };
