<!--
SPDX-FileCopyrightText: 2020 Max Reznik <reznikmm@gmail.com>

SPDX-License-Identifier: MIT
-->

# fedora-ada-action

This action builds RPM for an Ada project on Fedora.

## Inputs

### `spec`

**Required** The path to `spec` file. Default `"rpm.spec"`.

## Outputs

### `RPM`

List of built RPMs separated by colon (`:`).

## Example usage

```
    steps:
      - uses: actions/checkout@v2
        with:
          path: ada-pretty
      - uses: reznikmm/fedora-ada-action@v2
        with:
          spec: ada-pretty/packages/travis/ada-pretty.spec
      - uses: hpcsc/upload-bintray-docker-action@v1
        with:
          username: reznikmm
          repository: matreshka
          package: ada-pretty
          version: head-fc31
          sourcePath: x86_64/*
          apiKey: ${{secrets.BINTRAY_API_KEY}}

```

or in [my repository](https://github.com/reznikmm/ada-pretty/)
