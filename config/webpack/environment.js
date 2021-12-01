// const { environment } = require('@rails/webpacker')
const { resolve } = require('path');
const { config, environment, Environment } = require('@rails/webpacker');
const WebpackerPwa = require('webpacker-pwa');
new WebpackerPwa(config, environment);
module.exports = environment;

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
module.exports = environment
