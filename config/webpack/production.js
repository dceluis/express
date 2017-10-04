const MinifyPlugin = require("babel-minify-webpack-plugin");
const environment = require('./environment')

environment.plugins.delete('UglifyJs')
environment.plugins.set( 'Minify', new MinifyPlugin )

module.exports = environment.toWebpackConfig()
