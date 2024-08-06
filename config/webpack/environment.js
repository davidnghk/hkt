const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')

// yarn add bootstrap jquery popper.js
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

environment.loaders.prepend('coffee', coffee)
environment.loaders.delete('nodeModules')
module.exports = environment
