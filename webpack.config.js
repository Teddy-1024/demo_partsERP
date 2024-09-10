const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: {
    main: [
      path.resolve(__dirname, 'static/js/app.js'),
      path.resolve(__dirname, 'static/css/main.css')
    ]
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