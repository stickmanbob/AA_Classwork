module.exports = {
    entry: './frontend/todo_redux.jsx',
    output: {
        filename: 'bundle.js',
        path: __dirname + '/app/assets/javascripts'
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    query: {
                        presets: ["@babel/preset-env", "@babel/preset-react"]
                    }
                }
            }
        ]
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.jsx', '.*']
    }
}

