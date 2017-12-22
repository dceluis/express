const MinifyPlugin = require("babel-minify-webpack-plugin");
const environment = require('./environment')

environment.plugins.delete('UglifyJs')
environment.plugins.append( 'Minify', new MinifyPlugin({}, { sourceMap: null }) )

module.exports = environment.toWebpackConfig()
