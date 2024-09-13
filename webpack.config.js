const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: {
    /*
    main: [
      path.resolve(__dirname, 'static/js/app.js'),
      ...glob.sync(path.resolve(__dirname, 'static/css/main/**       /*.css')) // Include CSS files for the main page
    ],
    */
    // Core
    core_home: [
      path.resolve(__dirname, 'static/js/pages/core/home.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/home.css')
    ],
    core_contact: [
      path.resolve(__dirname, 'static/js/pages/core/contact.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/contact.css')
    ],
    core_services: [
      path.resolve(__dirname, 'static/js/pages/core/services.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/services.css')
    ],
    core_admin_home: [
      path.resolve(__dirname, 'static/js/pages/core/admin_home.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/admin_home.css')
    ],
    // Legal
    legal_license: [
      path.resolve(__dirname, 'static/js/pages/legal/license.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/legal/license.css')
    ],
    // Store
    store_home: [
      path.resolve(__dirname, 'static/js/pages/store/home.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/store/home.css')
    ],
    store_product_categories: [
      path.resolve(__dirname, 'static/js/pages/store/product_categories.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/store/product_categories.css')
    ],
    store_product_permutations: [
      path.resolve(__dirname, 'static/js/pages/store/product_permutations.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/store/product_permutations.css')
    ],
    store_stock_items: [
      path.resolve(__dirname, 'static/js/pages/store/stock_items.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/store/stock_items.css')
    ],
  },
  output: {
    filename: 'js/[name].bundle.js',
    path: path.resolve(__dirname, 'static/dist'),
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
        ],
      },
      {
          test: /\.js$/,
          exclude: path.resolve(__dirname, 'templates'), // Exclude templates folder
          use: {
              loader: 'babel-loader',
          },
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'css/[name].css',
    }),
  ],
  resolve: {
    extensions: ['.js', '.json', '.wasm']
  }
};