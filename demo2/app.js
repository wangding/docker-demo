#!/usr/bin/env node

import chalk from 'chalk';
//const chalk = require('chalk'),
const      log   = console.log;

log('This is ' + chalk.red('red.'));
log('This is ' + chalk.green('green.'));
log('This is ' + chalk.red('red') + ' and ' + chalk.green('green.'));
