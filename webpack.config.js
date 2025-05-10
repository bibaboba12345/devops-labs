// webpack.config.js
const path = require('path');

module.exports = {
  entry: './src/index.js',  // Frontend entry (adjust if backend)
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public'), // Output folder
  },
  mode: 'development',      // or 'production'
  target: 'node'            // Add this ONLY for backend bundling
};

