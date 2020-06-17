const path = require('path');

const CopyWebpackPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const {
  CleanWebpackPlugin
} = require('clean-webpack-plugin');

module.exports = {
  entry: {
    app: [path.resolve(__dirname, 'src/js/app.js'), path.resolve(__dirname, 'src/sass/app.sass')],
    bingo: [path.resolve(__dirname, 'src/sass/bingo.sass')]
  },
  module: {
    rules: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.css$/,
        use: [{
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: '..'
            }
          },
          'css-loader'
        ]
      },
      {
        test: /\.s[ac]ss$/,
        use: [{
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: '..'
            }
          },
          'css-loader',
          'sass-loader'
        ]
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/,
        use: {
          loader: 'file-loader',
          options: {
            name: 'fonts/[hash].[ext]'
          }
        }
      }
    ],
  },
  plugins: [
    new CleanWebpackPlugin(),
    new MiniCssExtractPlugin({
      filename: 'css/[name].css'
    }),
    new CopyWebpackPlugin({
      patterns: [{
        from: path.resolve(__dirname, 'src/static'),
        to: path.resolve(__dirname, 'dist')
      }]
    })
  ],
  resolve: {
    extensions: ['.js'],
  },
  output: {
    filename: 'js/[name].js',
    path: path.resolve(__dirname, 'dist')
  }
}