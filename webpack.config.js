const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: {
    main: [
      path.resolve(__dirname, 'static/js/app.js'),
      path.resolve(__dirname, 'static/css/main.css'),
      path.resolve(__dirname, 'static/css/components/button.css'),
      path.resolve(__dirname, 'static/css/components/card.css'),
      path.resolve(__dirname, 'static/css/components/dialog.css'),
      path.resolve(__dirname, 'static/css/components/form.css'),
      path.resolve(__dirname, 'static/css/components/modal.css'),
      path.resolve(__dirname, 'static/css/components/navigation.css'),
      path.resolve(__dirname, 'static/css/components/overlay.css'),
      path.resolve(__dirname, 'static/css/components/table.css'),
      path.resolve(__dirname, 'static/css/layouts/header.css'),
      path.resolve(__dirname, 'static/css/layouts/footer.css'),
      path.resolve(__dirname, 'static/css/layouts/table-main.css'),
      path.resolve(__dirname, 'static/css/lib/reset.css'),
      path.resolve(__dirname, 'static/css/lib/typography.css'),
      path.resolve(__dirname, 'static/css/lib/utils.css'),
      path.resolve(__dirname, 'static/css/lib/variables.css'),
      path.resolve(__dirname, 'static/css/themes/light.css'),
      // ...glob.sync(path.resolve(__dirname, 'static/css/main/**       /*.css')) // Include CSS files for the main page
    ],
    // Core
    core_home: [
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/home.css')
    ],
    core_contact: [
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/contact.css')
    ],
    core_services: [
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/services.css')
    ],
    core_admin_home: [
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/core/admin_home.css')
    ],
    // Legal
    /*
    legal_accessibility_report: [
      path.resolve(__dirname, 'static/js/pages/legal/accessibility_report.js'),
      path.resolve(__dirname, 'static/css/sections/core.css'),
      path.resolve(__dirname, 'static/css/pages/legal/accessibility_report.css')
    ],
    */
    legal_accessibility_statement: [
      path.resolve(__dirname, 'static/css/sections/legal.css'),
      path.resolve(__dirname, 'static/css/pages/legal/accessibility_statement.css')
    ],
    legal_retention_schedule: [
      path.resolve(__dirname, 'static/css/sections/legal.css'),
      path.resolve(__dirname, 'static/css/pages/legal/retention_schedule.css')
    ],
    legal_license: [
      path.resolve(__dirname, 'static/css/sections/legal.css'),
      path.resolve(__dirname, 'static/css/pages/legal/license.css')
    ],
    legal_privacy_policy: [
      path.resolve(__dirname, 'static/css/sections/legal.css'),
      path.resolve(__dirname, 'static/css/pages/legal/privacy_policy.css')
    ],
    // Store
    store_home: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/home.css')
    ],
    store_products: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/products.css')
    ],
    store_product_categories: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/product_categories.css')
    ],
    store_product_permutations: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/product_permutations.css')
    ],
    store_stock_items: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/stock_items.css')
    ],
    store_suppliers: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/supplier.css')
    ],
    store_supplier_purchase_orders: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/supplier_purchase_order.css')
    ],
    store_manufacturing_purchase_orders: [
      path.resolve(__dirname, 'static/css/sections/store.css'),
      path.resolve(__dirname, 'static/css/pages/store/manufacturing_purchase_order.css')
    ],
  },
  output: {
    filename: 'js/[name].bundle.js',
    path: path.resolve(__dirname, 'static/dist'),
    chunkFilename: '[name].chunk.js', // Non-entry chunk filename
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
      filename: 'css/[name].bundle.css',
    }),
  ],
  resolve: {
    extensions: ['.js', '.json', '.wasm']
  },
  optimization: {
    splitChunks: {
      chunks: 'all'
    }
  }
};