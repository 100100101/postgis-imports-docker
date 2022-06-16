module.exports = {
    root: true,
    // parser: '@babel/eslint-parser',
    parser: '@typescript-eslint/parser',
    extends: [
        'eslint:recommended',
        'plugin:json/recommended',
        'plugin:@typescript-eslint/recommended',
    ],
    env: {
        commonjs: true,
        node: true,
        browser: false,
        // es6: true,
        es2021: true,
    },
    parserOptions: {
        ecmaVersion: 2021,
        // ecmaVersion: 12,
        sourceType: 'module',
        // ecmaFeatures: {
        //     experimentalObjectRestSpread: true,
        //     jsx: false,
        // },
        // sourceType: 'module',
    },
    // overrides: [
    //     {
    //         files: [
    //             '**/__tests__/*.{j,t}s?(x)',
    //             '**/tests/unit/**/*.spec.{j,t}s?(x)',
    //         ],
    //         env: {
    //             jest: true,
    //         },
    //     },
    // ],
    rules: {
        // "indent": ["error", 2, { "SwitchCase": 1 }],
        // "linebreak-style": ["error", "unix"],
        // 'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
        // 'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
        'no-console': 0,
        // quotes: ['error', 'single'],
        // semi: ['error', 'always'],
        // 'prettier/prettier': 'error',
        'no-unused-vars': 'off',
        'no-undef': 'off',
        'prettier/prettier': 'error',
        '@typescript-eslint/no-var-requires': 'off',
        // '@typescript-eslint/no-explicit-any': 'off',
        // '@typescript-eslint/explicit-module-boundary-types': 'off',
        // "@typescript-eslint/rule-name": "error"
        // "@typescript-eslint/no-unused-vars": "error",
        // "@typescript-eslint/consistent-type-definitions": ["error", "type"],
    },
    plugins: ['@typescript-eslint', 'simple-import-sort', 'prettier'],
}
