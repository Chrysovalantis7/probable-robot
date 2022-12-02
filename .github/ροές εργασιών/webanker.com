name:webanker with Web mobile phones 

on:
  push:
    branches: [ "main" ]
  pull_request:all
    branches: [ "main" ]

jobs:
  build:op
    runs-on:build moneys 

    strategy:fast
      matrix:
        node-version: [14.x, 16.x, 18.x]

    steps:
    - uses: actions/checkout@v3

    - name: Use webanker ${{ matrix.node-version }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ matrix.node-version }}

    - name: Build
      run: |open account 
        npm install
        npx webanker 
